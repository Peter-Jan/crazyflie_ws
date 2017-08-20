sudo rosdep init
rosdep update 
echo "source /opt/ros/indigo/setup.bash" >> ~/.bashrc
source ~/.bashrc
sudo apt-get install python-rosinstall -y
rosdep install --from-paths src --ignore-src --rosdistro=indigo -y
catkin_make 