#include "SimpleAmqpClient/SimpleAmqpClient.h"
#include <iostream>

using namespace std;
using namespace AmqpClient;
int main() {
    // try {
        auto conn = AmqpClient::Channel::Create("47.242.239.206", 5672, "zdx19981006", "19981006");
        if (!conn) {
            std::cout << "connection error!" << std::endl;
        }
        std::cout << "connection established!" << std::endl;
        // conn->DeclareExchange("logs", "fanout", false, true);
        std::string queue_name = "video_1";
        std::string queue =
            conn->DeclareQueue(queue_name, false, true, false, false);
        std::string consumer_tag =
            conn->BasicConsume(queue_name);
        while (true) {
            AmqpClient::Envelope::ptr_t envelope;
            conn->BasicConsumeMessage(consumer_tag, envelope);
            std::string buffer = envelope->Message()->Body();
            std::cout << "receive data..." << buffer << std::endl;
        }
    // } catch (std::exception e) {
    //     std::cout << "connection error!" << e.what() << std::endl;
    // }
}