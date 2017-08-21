# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "optitrack: 2 messages, 0 services")

set(MSG_I_FLAGS "-Ioptitrack:/home/peter/crazyflie_ws/src/optitrack/msg;-Igeometry_msgs:/opt/ros/indigo/share/geometry_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/indigo/share/sensor_msgs/cmake/../msg;-Istd_msgs:/opt/ros/indigo/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(optitrack_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/peter/crazyflie_ws/src/optitrack/msg/RigidBody.msg" NAME_WE)
add_custom_target(_optitrack_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "optitrack" "/home/peter/crazyflie_ws/src/optitrack/msg/RigidBody.msg" "geometry_msgs/Quaternion:geometry_msgs/Point:geometry_msgs/Pose"
)

get_filename_component(_filename "/home/peter/crazyflie_ws/src/optitrack/msg/RigidBodyArray.msg" NAME_WE)
add_custom_target(_optitrack_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "optitrack" "/home/peter/crazyflie_ws/src/optitrack/msg/RigidBodyArray.msg" "geometry_msgs/Point:geometry_msgs/Pose:geometry_msgs/Quaternion:std_msgs/Header:optitrack/RigidBody"
)

#
#  langs = gencpp;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(optitrack
  "/home/peter/crazyflie_ws/src/optitrack/msg/RigidBodyArray.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/home/peter/crazyflie_ws/src/optitrack/msg/RigidBody.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/optitrack
)
_generate_msg_cpp(optitrack
  "/home/peter/crazyflie_ws/src/optitrack/msg/RigidBody.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/optitrack
)

### Generating Services

### Generating Module File
_generate_module_cpp(optitrack
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/optitrack
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(optitrack_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(optitrack_generate_messages optitrack_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/peter/crazyflie_ws/src/optitrack/msg/RigidBody.msg" NAME_WE)
add_dependencies(optitrack_generate_messages_cpp _optitrack_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/peter/crazyflie_ws/src/optitrack/msg/RigidBodyArray.msg" NAME_WE)
add_dependencies(optitrack_generate_messages_cpp _optitrack_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(optitrack_gencpp)
add_dependencies(optitrack_gencpp optitrack_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS optitrack_generate_messages_cpp)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(optitrack
  "/home/peter/crazyflie_ws/src/optitrack/msg/RigidBodyArray.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/home/peter/crazyflie_ws/src/optitrack/msg/RigidBody.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/optitrack
)
_generate_msg_lisp(optitrack
  "/home/peter/crazyflie_ws/src/optitrack/msg/RigidBody.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/optitrack
)

### Generating Services

### Generating Module File
_generate_module_lisp(optitrack
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/optitrack
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(optitrack_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(optitrack_generate_messages optitrack_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/peter/crazyflie_ws/src/optitrack/msg/RigidBody.msg" NAME_WE)
add_dependencies(optitrack_generate_messages_lisp _optitrack_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/peter/crazyflie_ws/src/optitrack/msg/RigidBodyArray.msg" NAME_WE)
add_dependencies(optitrack_generate_messages_lisp _optitrack_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(optitrack_genlisp)
add_dependencies(optitrack_genlisp optitrack_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS optitrack_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(optitrack
  "/home/peter/crazyflie_ws/src/optitrack/msg/RigidBodyArray.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/home/peter/crazyflie_ws/src/optitrack/msg/RigidBody.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/optitrack
)
_generate_msg_py(optitrack
  "/home/peter/crazyflie_ws/src/optitrack/msg/RigidBody.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/optitrack
)

### Generating Services

### Generating Module File
_generate_module_py(optitrack
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/optitrack
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(optitrack_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(optitrack_generate_messages optitrack_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/peter/crazyflie_ws/src/optitrack/msg/RigidBody.msg" NAME_WE)
add_dependencies(optitrack_generate_messages_py _optitrack_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/peter/crazyflie_ws/src/optitrack/msg/RigidBodyArray.msg" NAME_WE)
add_dependencies(optitrack_generate_messages_py _optitrack_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(optitrack_genpy)
add_dependencies(optitrack_genpy optitrack_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS optitrack_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/optitrack)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/optitrack
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(optitrack_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(optitrack_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(optitrack_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/optitrack)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/optitrack
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(optitrack_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(optitrack_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(optitrack_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/optitrack)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/optitrack\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/optitrack
    DESTINATION ${genpy_INSTALL_DIR}
    # skip all init files
    PATTERN "__init__.py" EXCLUDE
    PATTERN "__init__.pyc" EXCLUDE
  )
  # install init files which are not in the root folder of the generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/optitrack
    DESTINATION ${genpy_INSTALL_DIR}
    FILES_MATCHING
    REGEX "${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/optitrack/.+/__init__.pyc?$"
  )
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(optitrack_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(optitrack_generate_messages_py sensor_msgs_generate_messages_py)
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(optitrack_generate_messages_py std_msgs_generate_messages_py)
endif()
