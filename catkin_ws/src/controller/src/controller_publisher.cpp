#include <ros/ros.h>
// #include <rabbitmq-c/tcp_socket.h>
#include "msgs/controller.h"
#include "qcloud_iot_import.h"
#include "qcloud_iot_export.h"
#include "exports/qcloud_iot_export_mqtt.h"
#include <iostream>
// #include "SimpleAmqpClient/SimpleAmqpClient.h"
/* include路径 
 /usr/lib/gcc/x86_64-linux-gnu/9/include
 /usr/local/include
 /usr/include/x86_64-linux-gnu
 /usr/include
*/


// using namespace std;
#include "json/json.h"

#ifdef __cplusplus
extern "C" {
#endif

#include "lite-utils.h"
#ifdef __cplusplus
}
#endif

#define MAX_LENGTH 128
#define MAX_TOPIC_SIZE 16 * 1024
// #define TYPE_DATA "data"
// #define DEVICE_JSON_FILE "/home/xjh/iothub_test/config/test/device_info.json"
static int publish_msg_to_cloud(void *client, const char *topic_keywords, QoS qos, char *msg) {
    char topic_name[MAX_LENGTH] = {0};
    DeviceInfo *dev_info = IOT_MQTT_GetDeviceInfo(client);
    //格式化输出字符
    int size = HAL_Snprintf(topic_name, MAX_LENGTH, "%s/%s/%s", dev_info->product_id, dev_info->device_name, topic_keywords);
    if(size < 0 || size > MAX_LENGTH - 1) {
        Log_e("topic content length not enough! content size: %d buffer size: %d", size, MAX_LENGTH);
        return QCLOUD_ERR_FAILURE;
    }
    static int pub_cnt = 0;
    PublishParams pub_params = DEFAULT_PUB_PARAMS;
    pub_params.qos = qos;

    char topic_content[MAX_TOPIC_SIZE] = {0};
    size = HAL_Snprintf(topic_content, MAX_TOPIC_SIZE, msg);
    if(size < 0 || size > MAX_TOPIC_SIZE - 1) {
        Log_e("topic content length not enough! content size: %d buffer size: %d", size, MAX_TOPIC_SIZE);
        return QCLOUD_ERR_FAILURE;
    }
    pub_params.payload = topic_content;
    pub_params.payload_len = strlen(topic_content);
    return IOT_MQTT_Publish(client, topic_name, &pub_params);
}

int main(int argc, char** argv)
{
    ros::init(argc, argv, "remote_controller_publisher");
    ros::NodeHandle nh;
    ros::Publisher pub = nh.advertise<msgs::controller>("/remote_controller_info", 10);
    ros::Rate loop_rate(1);
    while(ros::ok)
    {
        ros::spinOnce();
        msgs::controller contr;
        contr.acceleration = 1;
        pub.publish(contr);
        ROS_INFO("publish");
        loop_rate.sleep();
    }
    return 0;
}