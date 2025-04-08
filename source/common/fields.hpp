#pragma once
#include <string>
#include <unordered_map>

namespace bitrpc
{
//RPC请求参数    
#define KEY_METHOD "method"
#define KEY_PARAMS "parameters"

//主题操作
#define KEY_TOPIC_KEY "topic_key"
#define KEY_TOPIC_MSG "topic_msg"
#define KEY_OPTYPE "optype"

//服务操作
#define KEY_HOST "host"//主机信息
#define KEY_HOST_IP "ip"
#define KEY_HOST_PORT "port"

//响应参数
#define KEY_RCODE "rcode"//响应状态码
#define KEY_RESULT "result"//响应结果

    //消息类型
    enum class MType
    {
        REQ_RPC = 0, //请求rpc
        RSP_RPC,     //响应rpc
        REQ_TOPIC,   //请求主题
        RSP_TOPIC,   //响应主题
        REQ_SERVICE,  //请求服务
        RSP_SERVICE   //响应服务
    };

    enum class RCode
    {
        RCODE_OK = 0,
        RCODE_PARSE_FAILED,
        RCODE_ERROR_MSGTYPE,
        RCODE_INVALID_MSG,
        RCODE_DISCONNECTED,
        RCODE_INVALID_PARAMS,
        RCODE_NOT_FOUND_SERVICE,
        RCODE_INVALID_OPTYPE, //无效的操作类型
        RCODE_NOT_FOUND_TOPIC,
        RCODE_INTERNAL_ERROR
    };
    static std::string errReason(RCode code)
    {
        static std::unordered_map<RCode, std::string> err_map = {
            {RCode::RCODE_OK, "成功处理！"},
            {RCode::RCODE_PARSE_FAILED, "消息解析失败！"},
            {RCode::RCODE_ERROR_MSGTYPE, "消息类型错误！"},
            {RCode::RCODE_INVALID_MSG, "无效消息"},
            {RCode::RCODE_DISCONNECTED, "连接已断开！"},
            {RCode::RCODE_INVALID_PARAMS, "无效的Rpc参数！"},
            {RCode::RCODE_NOT_FOUND_SERVICE, "没有找到对应的服务！"},
            {RCode::RCODE_INVALID_OPTYPE, "无效的操作类型"},
            {RCode::RCODE_NOT_FOUND_TOPIC, "没有找到对应的主题！"},
            {RCode::RCODE_INTERNAL_ERROR, "内部错误！"}};
        auto it = err_map.find(code);
        if (it == err_map.end())
        {
            return "未知错误！";
        }
        return it->second;
    }
    
    //RPC请求类型定义
    enum class RType
    {
        REQ_ASYNC = 0,
        REQ_CALLBACK
    };

    //主题操作类型定义
    enum class TopicOptype
    {
        TOPIC_CREATE = 0,
        TOPIC_REMOVE,
        TOPIC_SUBSCRIBE,
        TOPIC_CANCEL,
        TOPIC_PUBLISH
    };

    //服务操作类型定义
    enum class ServiceOptype
    {
        SERVICE_REGISTRY = 0,
        SERVICE_DISCOVERY,
        SERVICE_ONLINE,
        SERVICE_OFFLINE,
        SERVICE_UNKNOW
    };
}