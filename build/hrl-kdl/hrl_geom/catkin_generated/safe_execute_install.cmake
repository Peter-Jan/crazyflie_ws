execute_process(COMMAND "/home/peter/crazyflie_ws/build/hrl-kdl/hrl_geom/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/peter/crazyflie_ws/build/hrl-kdl/hrl_geom/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
