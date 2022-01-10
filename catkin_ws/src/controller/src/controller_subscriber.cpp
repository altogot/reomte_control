#include <ros/ros.h>
#include "msgs/controller.h"

ros::Duration d(1);

void controller_callback(const msgs::controller::ConstPtr& msg)
{
    ROS_INFO("acceleration: %lf", msg->acceleration);
}

int main(int argc, char ** argv) 
{
    ros::init(argc, argv, "remote_controller_subscriber");
    ros::NodeHandle nh;
    ros::Subscriber sub = nh.subscribe("/remote_controller_info", 10, &controller_callback);
    // ros::Rate loop_rate(5);
    ros::spin();
    ros::waitForShutdown();
    return 0;
}