#include <SimpleAmqpClient/SimpleAmqpClient.h>
#include <iostream>
#include <string>
using namespace std;
int main() {
    string queue = "hello";
    AmqpClient::Channel::ptr_t channel = AmqpClient::Channel::Create();
    channel->DeclareQueue(queue, false, false, false, false);
    string str = "hello world!";
    channel->BasicPublish("", queue, AmqpClient::BasicMessage::Create(str));
    cout << "sent hello world";
}