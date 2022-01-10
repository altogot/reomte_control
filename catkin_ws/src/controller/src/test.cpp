/***
 * @Author: xjh
 * @Date: 2022-01-09 13:09:26
 * @LastEditTime: 2022-01-10 13:51:29
 * @LastEditors: user
 * @Description:
 * @FilePath: /remote_control/catkin_ws/src/controller/src/test.cpp
 * @ May the force be with you.
 */
#include "remote_control/iothub_connection.h"

static void run(void *client, int m) {
    while (true) {
        IOT_MQTT_Yield(client, 10);
    }
}

int main() {

    void *client;
    int get_client = 1;
    IotHubConnection car_controller;
    car_controller.set_mqtt_event_handler();
    car_controller.set_on_message_callback();
    car_controller.constuct_mqtt_client(client, get_client);
    // // client = IOT_MQTT_Construct(&init_params);
    if (get_client) {
        Log_i("Cloud Device Construct Success!");
    } else {
        Log_e("Cloud Device Construct Failed!");
    }

    // car_controller.publish_msg_to_cloud(client, TYPE_DATA, QOS0, "123123");
    car_controller._subscribe_topic_wait_result(client, TYPE_DATA, QOS0);
    std::thread t(run, client, 10);
    t.detach();
    sleep(1000);
    get_client = car_controller.IOTHUB_MQTT_Destroy(&client);
    return 0;
}