// System Includes
#include <iostream>
#include <math.h>
#include <sstream>
#include <fstream>
#include <string>
#include <time.h> 
using namespace std;

#include <ros/ros.h>
#include "std_msgs/Int8.h"

//1. Incluir custom msg
//#include "intersys/actions.h"
#include "std_msgs/Int8.h"
#include <geometry_msgs/Twist.h>

//#include "/home/erobots/ros/rosbuild_ws/jaguar/layer2_msgs/msg_gen/cpp/include/layer2_msgs/cmd_speeds.h"
//#include "/home/erobots/ros/rosbuild_ws/jaguar/layer3_msgs/msg_gen/cpp/include/layer3_msgs/obs_pose_cov.h"
#include "/home/jr/catkin_ws/src/p2p_indigo/include/librerias/obs_pose_cov.h"
//#include "/home/erobots/ros/ros_workspace/src/align_indigo/msg_gen/cpp/include/align/align_params.h"
//#include "align/align_params.h"

#include "align/align_params.h"
//#include "obs_pose_cov.h"

//#include "../../settings.h"

#define rad2deg(radians) ((radians) * (180.0 / M_PI))
#define deg2rad(deg) ((deg) * (M_PI / 180.0))
#define fix_angle(angle)(atan2(sin(angle), cos(angle)))

string jaguar_id = "_001";

double robot_speed = 0.6;
ros::Subscriber child_pose_sub_;
ros::Subscriber align_params_sub_;
ros::Subscriber p2p_params_sub_;

ros::Publisher align_params_pub_;
ros::Publisher p2p_params_pub_;
//ros::Publisher cmd_speeds_pub_;
ros::Publisher move_pub_;

geometry_msgs::Twist cmdvel_;
layer3_msgs::obs_pose_cov posecov;
align::align_params align_parameters;
//layer2_msgs::cmd_speeds speeds_msg;


bool aligned = false;

double maxVel = 1.0;
double maxTurn = 1.0;

void callback_align_params(const align::align_params::ConstPtr& msg)
{
	align_parameters = *msg;
	align_parameters.angle = fix_angle(align_parameters.angle);
	align_parameters.tolerance = fix_angle(align_parameters.tolerance);
}

void callback_mcam(const layer3_msgs::obs_pose_cov::ConstPtr& msg)
{
	ROS_ERROR("Entre a align");
	posecov = *msg;
	if(posecov.robot_id==0)
	{
		ROS_ERROR("Entre a align 0");
	posecov.pose.theta = fix_angle(posecov.pose.theta);

		if (align_parameters.status == 1 || align_parameters.status == 4)
		{
			ROS_ERROR("Entre a align 01");

			//4- Dar valor al mensaje
			//actionsMsg.aligning = 1;		
			if (abs(fix_angle(align_parameters.angle - posecov.pose.theta))<=align_parameters.tolerance)
			{
				ROS_ERROR("Entre a align 02");
				//if ((speeds_msg.right != 0)||(speeds_msg.left != 0)){
				if ((maxTurn != 0)&&(maxVel != 0)){
					ROS_ERROR("Entre a align 1");
				maxTurn = 0;
				maxVel = 0;
				cmdvel_.linear.x = maxVel;
        		cmdvel_.angular.z = maxTurn;
				cmdvel_.linear.y = 0;
				cmdvel_.linear.z = 0;
				move_pub_.publish(cmdvel_);

					//speeds_msg.left = 0;
					//speeds_msg.right = 0;
					//cmd_speeds_pub_.publish(speeds_msg);
				}
		
				aligned = true;
			}
			
			else if (fix_angle(align_parameters.angle - posecov.pose.theta)<0)
			{
				ROS_ERROR("Entre a align 2");
				maxTurn = -robot_speed;
				maxVel = -robot_speed;
				cmdvel_.linear.x = maxVel;
        		cmdvel_.angular.z = maxTurn;
				cmdvel_.linear.y = 0;
				cmdvel_.linear.z = 0;
				move_pub_.publish(cmdvel_);
				//speeds_msg.left = 15;
				//speeds_msg.right = -15;
				//cmd_speeds_pub_.publish(speeds_msg);
			}
			else
			{
				ROS_ERROR("Entre a align 3");
				maxTurn = robot_speed;
				maxVel = robot_speed;
				cmdvel_.linear.x = maxVel;
        		cmdvel_.angular.z = maxTurn;
				cmdvel_.linear.y = 0;
				cmdvel_.linear.z = 0;
				move_pub_.publish(cmdvel_);
				//speeds_msg.left = -15;
				//speeds_msg.right = 15;
				//cmd_speeds_pub_.publish(speeds_msg);
			}
		}

		ROS_ERROR("Entre a align 3.1");
		if((align_parameters.status == 4)&& aligned)
		{
			ROS_ERROR("Entre a align 4");
			align_parameters.go = 1;
			align_params_pub_.publish(align_parameters);
		}

		if((align_parameters.status == 0))
		{
			ROS_ERROR("Entre a align 4.1");
			//if ((speeds_msg.right != 0)||(speeds_msg.left != 0)){
			if ((maxTurn != 0)&&(maxVel != 0)){
				ROS_ERROR("Entre a align 5");
				maxTurn = 0;
				maxVel = 0;
				cmdvel_.linear.x = maxVel;
        		cmdvel_.angular.z = maxTurn;
				cmdvel_.linear.y = 0;
				cmdvel_.linear.z = 0;
				move_pub_.publish(cmdvel_);
				//speeds_msg.left = 0;
				//speeds_msg.right = 0;
				//cmd_speeds_pub_.publish(speeds_msg);
			}
		}
		ROS_ERROR("Entre a align 5.1");
	}
		//se puede agregar otro caso en el que se encuentre cerca y se usa una velocidad mas baja

	ROS_ERROR("Entre a align 6");
	}

int main(int argc, char **argv){
	ros::init(argc, argv, "align_02");
	ros::NodeHandle n;

	align_parameters.status = 0;
	child_pose_sub_ = n.subscribe<layer3_msgs::obs_pose_cov>(("child_pose"), 1, callback_mcam);
	align_params_sub_ = n.subscribe<align::align_params>(("align_params"+jaguar_id), 1, callback_align_params);
	
	//cmd_speeds_pub_ = n.advertise<layer2_msgs::cmd_speeds>(("cmd_speeds"+jaguar_id),1);
	align_params_pub_ = n.advertise<align::align_params>(("align_params"+jaguar_id),1);
	ROS_ERROR("Entre a align publico jaguarid");
	move_pub_ = n.advertise<geometry_msgs::Twist>("drrobot_cmd_vel"+jaguar_id, 1);

	ros::spin();
}

