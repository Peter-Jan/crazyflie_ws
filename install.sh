#!/bin/bash
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116
sudo apt-get update
sudo apt-get install ros-indigo-desktop-full -y
sudo rosdep init
rosdep update 
source /opt/ros/indigo/setup.bash
sudo apt-get install python-rosinstall -y
rosdep install --from-paths src --ignore-src --rosdistro=indigo -y
catkin_make
source ~/crazyflie_ws/devel/setup.bash
sudo apt-get install dkms
sudo git clone https://github.com/paroj/xpad.git /usr/src/xpad-0.4
sudo dkms install -m xpad -v 0.4
cd /usr/src/xpad-0.4
sudo git fetch
sudo git checkout origin/master
sudo dkms remove -m xpad -v 0.4 --all
sudo dkms install -m xpad -v 0.4
cd ~/crazyflie_ws
sudo cp optirx.py /home/$USER/.local/lib/python3.4/
sudo cp optirx.py /usr/local/lib/python2.7/dist-packages/
sudo cp optirx.py /usr/local/lib/python2.7/site-packages/
echo "source /opt/ros/indigo/setup.bash" >> ~/.bashrc
echo "source ~/crazyflie_ws/devel/setup.bash" >> ~/.bashrc
source ~/.bashrc
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install sublime-text