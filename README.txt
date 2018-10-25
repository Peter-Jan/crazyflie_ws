Setting up Linux
-author: Wooshik Kim, TA for ACSI
-last edit: 10/24/2018 
In this README, we will go through process provided by Peter Jan, who set up 
crazyflie with optitrack motion capture system. 

We are going to use Ubuntu 14.04 with ROS Indigo 
Why? 
Ubuntu 14.04 is compatible with ROS Indigo,
and we need ROS Indigo since it is compatible with Optitrack code
we are using from Koushil's lab. (side note: virtual machine provided from Crazyflie uses Ubuntu 14.04)

Now let's get what we need

1) Download Ubuntu 14.04 
https://tutorials.ubuntu.com/tutorial/tutorial-install-ubuntu-desktop-1604#4 


2) Setup environment in Ubuntu 14.04
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
	Peter Jan was previous TA for ACSI course. He went through 
	the process of integrating crazyflie, optitrack, and some controllers

	git clone https://github.com/Peter-Jan/crazyflie_ws.git

	From this point on we are going through install.sh
	You can simply do cd crazyflie_ws  chmod +x install.sh  ./install.sh
	However since some lines are out of date I will provide step by step guide

	2-3) Install ROS Indigo, update rosdep, and source bash to use from terminal
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

	2-4) Driver for Linux xpad controllercd crazyflie_ws 

	sudo git clone https://github.com/paroj/xpad.git /usr/src/xpad-0.4
	sudo dkms install -m xpad -v 0.4
	cd /usr/src/xpad-0.4
	sudo git fetch
	sudo git checkout origin/master
	sudo dkms remove -m xpad -v 0.4 --all
	sudo dkms install -m xpad -v 0.4

	https://github.com/paroj/xpad
	
	//Following sets udev permissions on Linux to use 
	//USB radio without being root

	//sudo groupadd plugdev
	//sudo usermod -a -G plugdev <username>

	Create a file named /etc/udev/rules.d/99-crazyradio.rules and add the following:
	SUBSYSTEM=="usb", ATTRS{idVendor}=="1915", ATTRS{idProduct}=="7777", MODE="0664", GROUP="plugdev"
	To connect Crazyflie 2.0 via usb, create a file name /etc/udev/rules.d/99-crazyflie.rules and add the following:
	SUBSYSTEM=="usb", ATTRS{idVendor}=="0483", ATTRS{idProduct}=="5740", MODE="0664", GROUP="plugdev"

	https://github.com/bitcraze/crazyflie-lib-python#setting-udev-permissions

	2-5) Setup Optitrack your python might be located somewhere else change it correct dir
	cd ~/crazyflie_ws
	sudo cp optirx.py /usr/lib/python3.4/  
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
