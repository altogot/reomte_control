
/*** 
 * @Author: xjh
 * @Date: 2021-12-17 14:14:20
 * @LastEditTime: 2022-01-09 12:59:54
 * @LastEditors: user
 * @Description: MQTT工具类
 * @FilePath: /iothub_test/src/test/include/remote_control/iothub_connection.h
 * @ May the force be with you.
 */


#include "qcloud_iot_import.h"
#include "qcloud_iot_export.h"
#include "exports/qcloud_iot_export_mqtt.h"
#include <iostream>
#include <fstream>
#include <thread>
#include "json/json.h"

#ifdef __cplusplus
extern "C"
{
#endif

#include "lite-utils.h"
#ifdef __cplusplus
}
#endif

#define MAX_LENGTH 128
#define MAX_TOPIC_SIZE 16 * 1024
/*
    订阅云端的消息名称
*/
#define TYPE_DATA "data"
 
/*** 
 * @description: 设备配置文件路径
 */
#define DEVICE_JSON_FILE "/home/xjh/iothub_test/config/test/device_info.json"
#define DEBUG

void default_mqtt_event_handler(void *pclient, void *handle_context, MQTTEventMsg *msg);

void default_on_message_callback(void *pClient, MQTTMessage *message, void *userData);

class IotHubConnection
{
public:

    /*** 
     * @description: 将数据发送至云端
     * @param {void} *client
     * @param {char} *topic_words
     * @param {QoS} qos
     * @param {char} *msg
     * @return {*}
     */
    int publish_msg_to_cloud(void *client, const char *topic_words, QoS qos, char *msg);

    /*** 
     * @description: 初始化mqtt连接
     * @param {MQTTInitParams} *initParams
     * @param {DeviceInfo} *device_info
     * @return {*}
     */
    int _setup_connect_init_params(MQTTInitParams *initParams, DeviceInfo *device_info);

    /*** 
     * @description:建立mqtt连接 
     * @param {void} *
     * @param {int} &get_client
     * @return {*}
     */
    int constuct_mqtt_client(void *&client, int &get_client);

    /*** 
     * @description: 订阅云端消息
     * @param {void} *client
     * @param {char} *topic_keyword
     * @param {QoS} qos
     * @return {*}
     */
    int _subscribe_topic_wait_result(void *client, char *topic_keyword, QoS qos);

    /*** 
     * @description: 设置事件handler
     * @param {MQTTEventHandleFun} f
     * @return {*}
     */
    void set_mqtt_event_handler(MQTTEventHandleFun f = default_mqtt_event_handler);

    /*** 
     * @description: 设置消息订阅回调函数
     * @param {OnMessageHandler} f
     * @return {*}
     */
    void set_on_message_callback(OnMessageHandler f = default_on_message_callback);

    /*** 
     * @description: 关闭连接
     * @param {void} *client
     * @return {*}
     */
    int IOTHUB_MQTT_Destroy(void *client);
    
    

private:

    // static CarController* instance_;

    // void *client;

    // int get_client;

    std::ofstream fout;
    

    /*** 
     * @description: 事件handler
     */
    MQTTEventHandleFun _mqtt_event_handler;

    /*** 
     * @description: 订阅消息回调函数
     */    
    OnMessageHandler _on_message_callback;
    
    

    // bool control_flag;

    // bool brake_flag;

    // bool gear_flag;

    // int gear_to_set;

    // double speed;

    // double acceleration;

    // double wheel_angle;
};


