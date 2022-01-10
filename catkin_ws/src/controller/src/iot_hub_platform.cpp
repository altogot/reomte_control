#include "remote_control/iothub_connection.h"

int IotHubConnection::publish_msg_to_cloud(void *client, const char *topic_keywords, QoS qos, char *msg) {
    char topic_name[MAX_LENGTH];
    memset(topic_name, 0, MAX_LENGTH);
    DeviceInfo *dev_info = IOT_MQTT_GetDeviceInfo(client);
    int size = HAL_Snprintf(topic_name, MAX_LENGTH, "%s/%s/%s", dev_info->product_id, dev_info->device_name, topic_keywords);
    if(size < 0 || size > MAX_LENGTH - 1) {
        #ifdef DEBUG
        Log_e("topic content length not enough! content size: %d buffer size: %d", size, MAX_LENGTH);
        #endif
        return QCLOUD_ERR_FAILURE;
    }
    // static int pub_cnt = 0;
    PublishParams pub_params = DEFAULT_PUB_PARAMS;
    pub_params.qos = qos;
    char topic_content[MAX_TOPIC_SIZE];
    memset(topic_content, 0, MAX_TOPIC_SIZE);
    size = HAL_Snprintf(topic_content, MAX_TOPIC_SIZE, msg);
    if(size < 0 || size > MAX_TOPIC_SIZE - 1) {
        #ifdef DEBUG
        Log_e("topic content length not enough! content size: %d buffer size: %d", size, MAX_TOPIC_SIZE);
        #endif
        return QCLOUD_ERR_FAILURE;
    }
    pub_params.payload = topic_content;
    pub_params.payload_len = strlen(topic_content);
    return IOT_MQTT_Publish(client, topic_name, &pub_params);
}


int IotHubConnection::_setup_connect_init_params(MQTTInitParams *initParams, DeviceInfo *device_info)
{
	initParams->product_id = device_info->product_id;
	initParams->device_name = device_info->device_name;

#ifdef AUTH_MODE_CERT
	char certs_dir[16] = "certs";
	char current_path[128];
	char *cwd = getcwd(current_path, sizeof(current_path));

	if (cwd == NULL)
	{
		Log_e("getcwd return NULL");
		return QCLOUD_ERR_FAILURE;
	}

#ifdef WIN32
	HAL_Snprintf(initParams->cert_file, FILE_PATH_MAX_LEN, "%s\\%s\\%s", current_path, certs_dir,
				 device_info->dev_cert_file_name);
	HAL_Snprintf(initParams->key_file, FILE_PATH_MAX_LEN, "%s\\%s\\%s", current_path, certs_dir,
				 device_info->dev_key_file_name);
#else
	HAL_Snprintf(initParams->cert_file, FILE_PATH_MAX_LEN, "%s/%s/%s", current_path, certs_dir,
				 device_info->dev_cert_file_name);
	HAL_Snprintf(initParams->key_file, FILE_PATH_MAX_LEN, "%s/%s/%s", current_path, certs_dir,
				 device_info->dev_key_file_name);
#endif

#else
	initParams->device_secret = device_info->device_secret;
#endif

	initParams->command_timeout = QCLOUD_IOT_MQTT_COMMAND_TIMEOUT;
	initParams->keep_alive_interval_ms = QCLOUD_IOT_MQTT_KEEP_ALIVE_INTERNAL;

	initParams->auto_connect_enable = 1;
	initParams->event_handle.h_fp = _mqtt_event_handler;
	initParams->event_handle.context = NULL;

	return QCLOUD_RET_SUCCESS;
}

int IotHubConnection::constuct_mqtt_client(void *&client, int &get_client) {
	//初始化设备信息
	DeviceInfo device_info = {0};
    get_client = HAL_GetDevInfoFromFile(DEVICE_JSON_FILE, (void*)&device_info);
    if(get_client != QCLOUD_RET_SUCCESS) {
        Log_e("get device info failed: %d", get_client);
        return get_client;
    }
    //初始化mqtt连接
    MQTTInitParams init_params = DEFAULT_MQTTINIT_PARAMS;

    get_client = _setup_connect_init_params(&init_params, &device_info);
	// std::cout << device_info.device_name << std::endl;
	// std::cout << device_info.product_id << std::endl;

    if(get_client != QCLOUD_RET_SUCCESS) {
        Log_e("init params error, rc = %d", get_client);
        return get_client;
    }
	client =  IOT_MQTT_Construct(&init_params);
	get_client = 1;
	return get_client;
} 

void default_mqtt_event_handler(void *pclient, void *handle_context, MQTTEventMsg *msg)
{
	MQTTMessage *mqtt_messge = (MQTTMessage *)msg->msg;
	uintptr_t packet_id = (uintptr_t)msg->msg;

	switch (msg->event_type)
	{
	case MQTT_EVENT_UNDEF:
		Log_i("undefined event occur.");
		break;

	case MQTT_EVENT_DISCONNECT:
		Log_i("MQTT disconnect.");
		break;

	case MQTT_EVENT_RECONNECT:
		Log_i("MQTT reconnect.");
		break;

	case MQTT_EVENT_PUBLISH_RECVEIVED:
		Log_i("topic message arrived but without any related handle: topic=%.*s, topic_msg=%.*s",
			  mqtt_messge->topic_len, mqtt_messge->ptopic, mqtt_messge->payload_len, mqtt_messge->payload);
		break;
	case MQTT_EVENT_SUBCRIBE_SUCCESS:
		Log_i("subscribe success, packet-id=%u", (unsigned int)packet_id);
		break;

	case MQTT_EVENT_SUBCRIBE_TIMEOUT:
		Log_i("subscribe wait ack timeout, packet-id=%u", (unsigned int)packet_id);
		break;

	case MQTT_EVENT_SUBCRIBE_NACK:
		Log_i("subscribe nack, packet-id=%u", (unsigned int)packet_id);
		break;

	case MQTT_EVENT_UNSUBCRIBE_SUCCESS:
		Log_i("unsubscribe success, packet-id=%u", (unsigned int)packet_id);
		break;

	case MQTT_EVENT_UNSUBCRIBE_TIMEOUT:
		Log_i("unsubscribe timeout, packet-id=%u", (unsigned int)packet_id);
		break;

	case MQTT_EVENT_UNSUBCRIBE_NACK:
		Log_i("unsubscribe nack, packet-id=%u", (unsigned int)packet_id);
		break;

	case MQTT_EVENT_PUBLISH_SUCCESS:
		Log_i("publish success, packet-id=%u", (unsigned int)packet_id);
		break;

	case MQTT_EVENT_PUBLISH_TIMEOUT:
		Log_i("publish timeout, packet-id=%u", (unsigned int)packet_id);
		break;

	case MQTT_EVENT_PUBLISH_NACK:
		Log_i("publish nack, packet-id=%u", (unsigned int)packet_id);
		break;
	default:
		Log_i("Should NOT arrive here.");
		break;
	}
}

void default_on_message_callback(void *pClient, MQTTMessage *message, void *userData)
{
    if (message == NULL) {
        return;
    }

    Log_i("Receive Message With topicName:%.*s, payload:%.*s", (int)message->topic_len, message->ptopic,
          (int)message->payload_len, (char *)message->payload);
}

int IotHubConnection::_subscribe_topic_wait_result(void *client, char *topic_keyword, QoS qos)
{
    char topic_name[MAX_LENGTH] = {0};
    DeviceInfo *dev_info = IOT_MQTT_GetDeviceInfo(client);

    int size = HAL_Snprintf(topic_name, sizeof(topic_name), "%s/%s/%s", dev_info->product_id, dev_info->device_name,
                            topic_keyword);
    if (size < 0 || size > sizeof(topic_name) - 1) {
        Log_e("topic content length not enough! content size:%d  buf size:%d", size, (int)sizeof(topic_name));
        return QCLOUD_ERR_FAILURE;
    }

    SubscribeParams sub_params    = DEFAULT_SUB_PARAMS;
    sub_params.qos                = qos;
    sub_params.on_message_handler = _on_message_callback;

    int rc = IOT_MQTT_Subscribe(client, topic_name, &sub_params);
    if (rc < 0) {
        Log_e("MQTT subscribe FAILED: %d", rc);
        return rc;
    }

    int wait_cnt = 10;
    while (!IOT_MQTT_IsSubReady(client, topic_name) && (wait_cnt > 0)) {
        // wait for subscription result
        rc = IOT_MQTT_Yield(client, 1000);
        if (rc) {
            Log_e("MQTT error: %d", rc);
            return rc;
        }
        wait_cnt--;
    }

    if (wait_cnt > 0) {
        return QCLOUD_RET_SUCCESS;
    } else {
        Log_e("wait for subscribe result timeout!");
        return QCLOUD_ERR_FAILURE;
    }
}

void IotHubConnection::set_mqtt_event_handler(MQTTEventHandleFun f) {
	this->_mqtt_event_handler = f;
}

void IotHubConnection::set_on_message_callback(OnMessageHandler f) {
	this->_on_message_callback = f;
}

int IotHubConnection::IOTHUB_MQTT_Destroy(void *client) {
	return IOT_MQTT_Destroy(&client);
}