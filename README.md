# Crazyflie Project Environment

Author: Wooshik Kim & Austin Wang, TA for ACSI

Last edited: 10/26/2018 

## Note to ACSI 2018 Students!!

I already set up the lab computer for instructor user! So you can try "Test the Environment" and "Connecting with Optitrack" right away. Skip "Setup Instructions". However, that computer is there to serve as a reference. It is not answer to everything. It still lacks many things. It just provides the bare minimum of this project. This guide is just here to tell you what are needed and to provide big picture of things. In the end YOU have to integrate the systems on your own. 

## Synopsis

ROS environment capable of interfacing with Crazyflie 2.0 and OptiTrack motion capture system

### Requirements

Ubuntu 16.04 

Ubuntu setup instructions: https://tutorials.ubuntu.com/tutorial/tutorial-install-ubuntu-desktop-1604#4 

## Setup Instructions

### Setup environment in Ubuntu 14.04 or 16.04

1) Install Ubuntu 16.04
	
	https://tutorials.ubuntu.com/tutorial/tutorial-install-ubuntu-desktop-1604#0 

2) Clone Peter's repo
	
	Peter Jan was previously a TA for the ACSI course. The repository contains Crazyflie
	firmware, Optitrack python code, along with other things
	```
	git clone https://github.com/Peter-Jan/crazyflie_ws.git
	```
	
	From this point on we are going through install.sh
	You can simply do cd crazyflie_ws `chmod +x install.sh  ./install.sh`
	However since some are out of date I will provide a step by step guide below

3) Install ROS, update rosdep, source bash to use from terminal, and make crazyflie_ws
	
<!-- 	Indigo
	```
	sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
	sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116
	sudo apt-get update
	sudo apt-get install ros-indigo-desktop-full
	sudo rosdep init
	rosdep update
	source /opt/ros/indigo/setup.bash
	sudo apt-get install python-rosinstall
	cd crazyflie_ws
	rosdep install --from-paths src --ignore-src --rosdistro=indigo -y
	catkin_make
	source ~/crazyflie_ws/devel/setup.bash
	sudo apt-get install dkms
	```
	Reference: http://wiki.ros.org/indigo/Installation/Ubuntu -->

	Kinetic
	```
	sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
	sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116
	sudo apt-get update
	sudo apt-get install ros-kinetic-desktop-full
	sudo rosdep init
	rosdep update
	source /opt/ros/kinetic/setup.bash
	sudo apt-get install python-rosinstall
	cd crazyflie_ws
	rosdep install --from-paths src --ignore-src --rosdistro=kinetic -y
	catkin_make
	source ~/crazyflie_ws/devel/setup.bash
	sudo apt-get install dkms
	```
	
	Reference: http://wiki.ros.org/kinetic/Installation/Ubuntu 

4) Driver for Linux xpad controllercd crazyflie_ws 
	```
	cd ..
	sudo git clone https://github.com/paroj/xpad.git /usr/src/xpad-0.4
	sudo dkms install -m xpad -v 0.4
	cd /usr/src/xpad-0.4
	sudo git fetch
	sudo git checkout origin/master
	sudo dkms remove -m xpad -v 0.4 --all
	sudo dkms install -m xpad -v 0.4
	```
	Reference: https://github.com/paroj/xpad
	
	Following sets udev permissions on Linux to use for USB radio without being root
	```
	cd ~
	sudo groupadd plugdev
	```

	Create a file named /etc/udev/rules.d/99-crazyradio.rules and add the following to connect Crazyflie 2.0 via usb:
	```
	SUBSYSTEM=="usb", ATTRS{idVendor}=="1915", ATTRS{idProduct}=="7777", MODE="0664", GROUP="plugdev"
	SUBSYSTEM=="usb", ATTRS{idVendor}=="0483", ATTRS{idProduct}=="5740", MODE="0664", GROUP="plugdev"
	```
	Reference: https://github.com/bitcraze/crazyflie-lib-python#setting-udev-permissions

5) Optitrack library from optirx, python based ROS examples are here
	
<!-- 	Indigo
	```
	cd ~/crazyflie_ws
	sudo cp optirx.py /usr/lib/python3.4/  
	sudo cp optirx.py /usr/local/lib/python2.7/dist-packages/
	sudo cp optirx.py /usr/local/lib/python2.7/site-packages/
	echo "source /opt/ros/indigo/setup.bash" >> ~/.bashrc
	echo "source ~/crazyflie_ws/devel/setup.bash" >> ~/.bashrc
	source ~/.bashrc
	``` -->

	Kinetic
	```
	cd ~/crazyflie_ws
	sudo cp optirx.py /usr/lib/python3.5/  
	sudo cp optirx.py /usr/local/lib/python2.7/dist-packages/
	sudo cp optirx.py /usr/local/lib/python2.7/site-packages/
	echo "source /opt/ros/indigo/setup.bash" >> ~/.bashrc
	echo "source ~/crazyflie_ws/devel/setup.bash" >> ~/.bashrc
	source ~/.bashrc
	```

### Test the environment

"Hello World!" Let's fly the drone using Xbox controller. This would be a good way to check if everything is working fine. 
Connect Crazyradio PA to your computer and open terminal. 
```
cd crazyflie_ws
roscore
```

The command "roscore" starts ros system. Now open a new terminal and run
```
rosrun crazyflie_tools scan
```

This will print the uri address for the crazyflie onto console (the ID of crazyflie you are flying)

The ID will be something like radio://0/20/2M

Copy this address into the launch file for teleoperation located at `/path_to_your_workspace/src/crazyflie_ros/crazyflie_demo/launch/teleop_xbox360.launch`

Now run 
```
roslaunch crazyflie_demo teleop_xbox360.launch
```
and you should be able to fly your drone! 

Reference: Section 3 of droneWriteUp.pdf 


### Connecting with Optitrack

1) Turn on Motive on Optitrack computer and open one of the recent calibration 
file in ACSI folder. 

2) Set your Crazyflie as a rigid body. The pose data of that rigid body will be sent to your computer. 

3) To connect your computer to Optitrack computer both should be connected via the switch port on the top of the shelf. 

4) Change connection (right top) to "acsi_ros", I already changed the the IP address. On other computers, connect and set the IP address of your main Ubuntu computer to `10.0.0.1 `

The Optitrack computer IP address is set to `10.0.0.2`. You can check if the two are connected by pinging each other's address.

5) Configure Motive to send rigid body data to your computer:
- Data Streaming -> check Broadcast Frame Data
- Advanced Network Options -> Multicast Interface to 10.0.0.1

6) Now start ros node for reading Optitrack data with `roslaunch optitrack optitrack_pipeline.launch`

After you terminate the process, the data will be saved in `home/.ros/optitrack_position` and `home/.ros/optitrack_orientation`


Now you are all set!
Have fun with your project! 

