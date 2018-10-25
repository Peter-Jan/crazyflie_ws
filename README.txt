Setting up Environment for Crazyflie Project
-author: Wooshik Kim, TA for ACSI
-last edit: 10/24/2018 
In this README, we will set up environment for crazyflie
with optitrack motion capture system. 

There are two ways of setting up.
You can either use Ubuntu 14.04 with ROS Indigo 
or use Ubuntu 16.04 with ROS Kinetic
The lab computer in Motion Capture room is set
up with Ubuntu 16.04 with ROS Kinetic

Now let's get what we need

1) Install Ubuntu 14.04 
https://tutorials.ubuntu.com/tutorial/tutorial-install-ubuntu-desktop-1604#4 
or Install Ubuntu 16.04

2) Setup environment in Ubuntu 14.04 or 16.04
	2-1) OPTIONAL:
	For me, when I was trying to sudo apt-get install I got shim(= 13-0ubuntu2) error. 
	To solve this I went through the following

	sudo apt-get download dpkg
	sudo dpkg -i dpkg_1.17.5ubuntu5.8_amd64.deb
	sudo apt-get update && sudo apt-get upgrade
	sudo apt-get -f install
	sudo apt-get update && sudo apt-get upgrade

	https://askubuntu.com/questions/1076247/after-clean-install-of-ubuntu-14-04-i-get-shim-signed-error 

	2-2) Clone Peter's repo
	Peter Jan was previous TA for ACSI course. There are crazyflie
	firmware, Optitrack python code, along with other things

	git clone https://github.com/Peter-Jan/crazyflie_ws.git

	From this point on we are going through install.sh
	You can simply do cd crazyflie_ws  chmod +x install.sh  ./install.sh
	However since some are out of date I will provide step by step guide below

	2-3) Install ROS, update rosdep, source bash to use from terminal, and make crazyflie_ws
	Indigo
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

	http://wiki.ros.org/indigo/Installation/Ubuntu


	Kinetic
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

	http://wiki.ros.org/kinetic/Installation/Ubuntu

	2-4) Driver for Linux xpad controllercd crazyflie_ws 

	cd ..
	sudo git clone https://github.com/paroj/xpad.git /usr/src/xpad-0.4
	sudo dkms install -m xpad -v 0.4
	cd /usr/src/xpad-0.4
	sudo git fetch
	sudo git checkout origin/master
	sudo dkms remove -m xpad -v 0.4 --all
	sudo dkms install -m xpad -v 0.4

	https://github.com/paroj/xpad
	
	Following sets udev permissions on Linux to use 
	USB radio without being root
	
	cd ~
	sudo groupadd plugdev

	Create a file named /etc/udev/rules.d/99-crazyradio.rules and add the following:
	Allows you to connect Crazyflie 2.0 via usb, 
	SUBSYSTEM=="usb", ATTRS{idVendor}=="1915", ATTRS{idProduct}=="7777", MODE="0664", GROUP="plugdev"
	SUBSYSTEM=="usb", ATTRS{idVendor}=="0483", ATTRS{idProduct}=="5740", MODE="0664", GROUP="plugdev"

	https://github.com/bitcraze/crazyflie-lib-python#setting-udev-permissions

	2-5) Optitrack library from optirx, python based ROS examples are here
	cd ~/crazyflie_ws
	sudo cp optirx.py /usr/lib/python3.4/  
	sudo cp optirx.py /usr/local/lib/python2.7/dist-packages/
	sudo cp optirx.py /usr/local/lib/python2.7/site-packages/
	echo "source /opt/ros/indigo/setup.bash" >> ~/.bashrc
	echo "source ~/crazyflie_ws/devel/setup.bash" >> ~/.bashrc
	source ~/.bashrc

	Kinetic
	cd ~/crazyflie_ws
	sudo cp optirx.py /usr/lib/python3.5/  
	sudo cp optirx.py /usr/local/lib/python2.7/dist-packages/
	sudo cp optirx.py /usr/local/lib/python2.7/site-packages/
	echo "source /opt/ros/indigo/setup.bash" >> ~/.bashrc
	echo "source ~/crazyflie_ws/devel/setup.bash" >> ~/.bashrc
	source ~/.bashrc

	2-6) Get Sumblime text if you haven't done so already
	Sublime text is a great text editor for C, C++, python, ... everything
	wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
	echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
	sudo apt-get update
	sudo apt-get install sublime-text

	http://tipsonubuntu.com/2017/05/30/install-sublime-text-3-ubuntu-16-04-official-way/

	Make Sublime default text editor
	subl /usr/share/applications/defaults.list
	then change all gedit with sublime_text


3) "Hello World!" Let's fly the drone using Xbox controller. This would be a good way to check if everything is working fine. 
Connect Crazyradio PA to your computer and open terminal. 

cd crazyflie_ws
roscore

The command "roscore" starts ros system. Now open a new terminal and run

rosrun crazyflie_tools scan

This will print the uri address for the crazyflie onto console (the ID of crazyflie you are flying)
The ID will be something like radio://0/20/2M
Copy this address into the launch file for teleoperation located at 
(/path_to_your_workspace/src/crazyflie_ros/crazyflie_demo/launch/teleop_xbox360.launch)
Now run 

roslaunch crazyflie_demo teleop_xbox360.launch

and you should be flying your drone! 

Section 3 of droneWriteUp.pdf 


4) Connecting with Optitrack
Turn on Motive on Optitrack computer and open one of the recent calibration 
file in ACSI folder. Set your Crazyflie as rigid body. That rigid body 
data will be sent to your computer. 

To connect your computer to Optitrack computer both should be connected 
via switch port on the top of the shelf. Connect and set the IP address of
your main Ubuntu computer to (you can right click wifi icon on top right)
10.0.0.1 
The Optitrack computer IP address is set to 
10.0.0.2
You can check if the two are connected by pinging each other's address.
Now from Motive you will set it to send rigid body data to your computer.
Open Data Streaming -> check Broadcast Frame Data, and from Advanced Network 
Options -> Multicast Interface to 10.0.0.1

Now start ros node for reading Optitrack data with
roslaunch optitrack optitrack_pipeline.launch

After you close process, the data will be saved in 
Home/.ros/
optitrack_position and optitrack_orientation


5) Now you are all set!
Have fun with your project! 
