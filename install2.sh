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
cd ..
sudo git clone https://github.com/paroj/xpad.git /usr/src/xpad-0.4
sudo dkms install -m xpad -v 0.4
cd /usr/src/xpad-0.4
sudo git fetch
sudo git checkout origin/master
sudo dkms remove -m xpad -v 0.4 --all
sudo dkms install -m xpad -v 0.4
cd ~
sudo groupadd plugdev
cd ~/crazyflie_ws
sudo cp optirx.py /usr/lib/python3.5/  
sudo cp optirx.py /usr/local/lib/python2.7/dist-packages/
sudo cp optirx.py /usr/local/lib/python2.7/site-packages/
echo "source /opt/ros/indigo/setup.bash" >> ~/.bashrc
echo "source ~/crazyflie_ws/devel/setup.bash" >> ~/.bashrc
source ~/.bashrc