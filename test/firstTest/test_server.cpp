#include "../../source/common/message.hpp"
#include "../../source/common/net.hpp"
#include "../../source/common/dispatcher.hpp"
#include "../../source/server/rpc_router.hpp"

void Add(const Json::Value &req, Json::Value &rsp)
{
    int num1 = req["num1"].asInt();
    int num2 = req["num2"].asInt();
    rsp = num1 + num2;
}

int main()
{
    auto router = std::make_shared<bitrpc::server::RpcRouter>();
    
    std::unique_ptr<bitrpc::server::SDescribeFactory> desc_factory(new bitrpc::server::SDescribeFactory());
    desc_factory->setMethodName("Add");
    desc_factory->setParamsDesc("num1", bitrpc::server::VType::INTEGRAL);
    desc_factory->setParamsDesc("num2", bitrpc::server::VType::INTEGRAL);
    desc_factory->setReturnType(bitrpc::server::VType::INTEGRAL);
    desc_factory->setCallback(Add);

    router->registerMethod(desc_factory->build());

    auto cb = std::bind(&bitrpc::server::RpcRouter::onRpcRequest, router.get(),
                        std::placeholders::_1, std::placeholders::_2);
    auto dispatcher = std::make_shared<bitrpc::Dispatcher>();
    dispatcher->registerHandler<bitrpc::RpcRequest>(bitrpc::MType::REQ_RPC, cb);

    auto server = bitrpc::ServerFactory::create(9090);
    auto message_cb = std::bind(&bitrpc::Dispatcher::onMessage, dispatcher.get(),
                                std::placeholders::_1, std::placeholders::_2);

    server->setMessageCallback(message_cb);
    server->start();
    return 0;
}
