#include "../../common/dispatcher.hpp"
#include "../../client/requestor.hpp"
#include "../../client/rpc_caller.hpp"


int main() {
    auto requestor = std::make_shared<bitrpc::client::Requestor>();
    auto caller = std::make_shared<bitrpc::client::RpcCaller>(requestor);

    auto dispatcher = std::make_shared<bitrpc::Dispatcher>();
    auto rsp_cb = std::bind(&bitrpc::client::Requestor::onResponse, requestor.get(),
                            std::placeholders::_1, std::placeholders::_2);
    dispatcher->registerHandler<bitrpc::BaseMessage>(bitrpc::MType::RSP_RPC, rsp_cb);

    auto client = bitrpc::ClientFactory::create("127.0.0.1", 9090);
    auto message_cb = std::bind(&bitrpc::Dispatcher::onMessage, dispatcher.get(),
                                std::placeholders::_1, std::placeholders::_2);
    client->setMessageCallback(message_cb);
    client->connect();

    auto conn = client->connection();
    Json::Value params, result;
    params["num1"] = 11;
    params["num2"] = 22;
    bool ret = caller->call(conn, "Add", params, result);
    if (ret != false) {
        std::cout << "result: " << result.asInt() << std::endl;
    }
    client->shutdown();
    return 0;
}