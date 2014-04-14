#!/bin/bash

git config --global credential.helper cache

sudo apt-get install python-rosinstall ipython libeigen3-dev libboost-all-dev doxygen libopencv-dev ros-hydro-vision-opencv ros-hydro-image-transport-plugins python-software-properties software-properties-common aptitude -y

sudo apt-get install ros-hydro-octomap ros-hydro-octomap-ros ros-hydro-octomap-rviz-plugins ros-hydro-octomap-msgs ros-hydro-octovis -y

sudo apt-get install libgflags-dev libgoogle-glog-dev -y

sudo add-apt-repository ppa:jmaye/ethz 
sudo apt-get update

UBUNTU_VERSION=$(lsb_release -a)
if [[ $UBUNTU_VERSION == *12* ]]
	then
		echo "Is 12.10 or 12.04!"
		sudo apt-get install libsuitesparse-dev
	else
		   echo "Installing custom libsuite sparse"
		   echo "IMPORTANT:  do NOT accept the first solution aptitude will propose to you! take the second solution "
		   sudo aptitude install libsuitesparse-dev=1:3.4.0-2ubuntu5~raring	
fi


cd ~/rosbuild_ws
rosws set aslam_install --git https://github.com/ethz-asl/aslam_install.git -y
source setup.bash
rosws update aslam_install
rosws merge $(rospack find aslam_install)/rosinstall/aslam_visual_inertial_working.rosinstall
source setup.bash
rosws update
rosmake aslam_node


