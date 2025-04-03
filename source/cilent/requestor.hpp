#pragma once
#include "../common/net.hpp"
#include "../common/message.hpp"
#include <future>
#include <functional>

namespace bitrpc
{
    namespace client
    {
        class Requestor
        {
        public:
            using ptr = std::shared_ptr<Requestor>;

            using RequestCallback = std::function<void(const BaseMessage::ptr &)>;
            using AsyncResponse = std::future<BaseMessage::ptr>;          //异步响应

            struct RequestDescribe
            {
                using ptr = std::shared_ptr<RequestDescribe>;

                BaseMessage::ptr request;                    //请求字段
                RType rtype;                                 //RPC请求类型  REQ_ASYNC异步调用  REQ_CALLBACK回调函数
                std::promise<BaseMessage::ptr> response;     //响应结果     std::future<int> res = std::promise<int>pro.get_future()
                RequestCallback callback;                    //REQ_CALLBACK回调函数
            };

            void onResponse(const BaseConnection::ptr &conn, BaseMessage::ptr &msg)
            {
                std::string rid = msg->rid();
                RequestDescribe::ptr rdp = getDescribe(rid);

                if (rdp.get() == nullptr)                    //get()返回其所智能指针所管理的原始指针
                {
                    ELOG("收到响应 - %s，但是未找到对应的请求描述！", rid.c_str());
                    return;
                }
                if (rdp->rtype == RType::REQ_ASYNC)
                {
                    rdp->response.set_value(msg);   //将接收到的响应消息msg设置到 promise<BaseMessage::ptr> rdp->response 中。
                                                    //这将使得在调用 rdp->response.get_future().get() 时，它将返回这个响应消息。
                }
                else if (rdp->rtype == RType::REQ_CALLBACK)
                {
                    if (rdp->callback)
                        rdp->callback(msg);
                }
                else
                {
                    ELOG("请求类型未知！！");
                }
                delDescribe(rid);
            }
            bool send(const BaseConnection::ptr &conn, const BaseMessage::ptr &req, AsyncResponse &async_rsp)
            {
                RequestDescribe::ptr rdp = newDescribe(req, RType::REQ_ASYNC);
                if (rdp.get() == nullptr)
                {
                    ELOG("构造请求描述对象失败！");
                    return false;
                }
                conn->send(req);
                async_rsp = rdp->response.get_future();
                return true;
            }
            bool send(const BaseConnection::ptr &conn, const BaseMessage::ptr &req, BaseMessage::ptr &rsp)
            {
                AsyncResponse rsp_future;
                bool ret = send(conn, req, rsp_future);
                if (ret == false)
                {
                    return false;
                }
                rsp = rsp_future.get();
                return true;
            }
            bool send(const BaseConnection::ptr &conn, const BaseMessage::ptr &req, const RequestCallback &cb)
            {
                RequestDescribe::ptr rdp = newDescribe(req, RType::REQ_CALLBACK, cb);
                if (rdp.get() == nullptr)
                {
                    ELOG("构造请求描述对象失败！");
                    return false;
                }
                conn->send(req);
                return true;
            }

        private:
            //增
            RequestDescribe::ptr newDescribe(const BaseMessage::ptr &req, RType rtype,
                                             const RequestCallback &cb = RequestCallback())
            {
                std::unique_lock<std::mutex> lock(_mutex);

                RequestDescribe::ptr rd = std::make_shared<RequestDescribe>();
                rd->request = req;
                rd->rtype = rtype;
                if (rtype == RType::REQ_CALLBACK && cb)
                {
                    rd->callback = cb;
                }

                _request_desc.insert(std::make_pair(req->rid(), rd));

                return rd;
            }
            //查
            RequestDescribe::ptr getDescribe(const std::string &rid)
            {
                std::unique_lock<std::mutex> lock(_mutex);

                auto it = _request_desc.find(rid);
                if (it == _request_desc.end())
                {
                    return RequestDescribe::ptr();
                }

                return it->second;
            }
            //删
            void delDescribe(const std::string &rid)
            {
                std::unique_lock<std::mutex> lock(_mutex);
                _request_desc.erase(rid);
            }

        private:
            std::mutex _mutex;
            std::unordered_map<std::string, RequestDescribe::ptr> _request_desc;
        };
    }
}