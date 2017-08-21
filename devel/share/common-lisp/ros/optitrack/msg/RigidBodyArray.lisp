; Auto-generated. Do not edit!


(cl:in-package optitrack-msg)


;//! \htmlinclude RigidBodyArray.msg.html

(cl:defclass <RigidBodyArray> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (bodies
    :reader bodies
    :initarg :bodies
    :type (cl:vector optitrack-msg:RigidBody)
   :initform (cl:make-array 0 :element-type 'optitrack-msg:RigidBody :initial-element (cl:make-instance 'optitrack-msg:RigidBody))))
)

(cl:defclass RigidBodyArray (<RigidBodyArray>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RigidBodyArray>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RigidBodyArray)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name optitrack-msg:<RigidBodyArray> is deprecated: use optitrack-msg:RigidBodyArray instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <RigidBodyArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader optitrack-msg:header-val is deprecated.  Use optitrack-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'bodies-val :lambda-list '(m))
(cl:defmethod bodies-val ((m <RigidBodyArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader optitrack-msg:bodies-val is deprecated.  Use optitrack-msg:bodies instead.")
  (bodies m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RigidBodyArray>) ostream)
  "Serializes a message object of type '<RigidBodyArray>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'bodies))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'bodies))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RigidBodyArray>) istream)
  "Deserializes a message object of type '<RigidBodyArray>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'bodies) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'bodies)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'optitrack-msg:RigidBody))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RigidBodyArray>)))
  "Returns string type for a message object of type '<RigidBodyArray>"
  "optitrack/RigidBodyArray")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RigidBodyArray)))
  "Returns string type for a message object of type 'RigidBodyArray"
  "optitrack/RigidBodyArray")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RigidBodyArray>)))
  "Returns md5sum for a message object of type '<RigidBodyArray>"
  "f986085eb31708c02ac750a1c1b0e27d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RigidBodyArray)))
  "Returns md5sum for a message object of type 'RigidBodyArray"
  "f986085eb31708c02ac750a1c1b0e27d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RigidBodyArray>)))
  "Returns full string definition for message of type '<RigidBodyArray>"
  (cl:format cl:nil "# Optitrack rigid bodies~%Header                  header~%optitrack/RigidBody[]  bodies~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: optitrack/RigidBody~%# Optitrack rigid body~%int32                 id~%bool                  tracking_valid~%float64               mrk_mean_error~%geometry_msgs/Pose    pose~%geometry_msgs/Point[] markers~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of postion and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RigidBodyArray)))
  "Returns full string definition for message of type 'RigidBodyArray"
  (cl:format cl:nil "# Optitrack rigid bodies~%Header                  header~%optitrack/RigidBody[]  bodies~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: optitrack/RigidBody~%# Optitrack rigid body~%int32                 id~%bool                  tracking_valid~%float64               mrk_mean_error~%geometry_msgs/Pose    pose~%geometry_msgs/Point[] markers~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of postion and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RigidBodyArray>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'bodies) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RigidBodyArray>))
  "Converts a ROS message object to a list"
  (cl:list 'RigidBodyArray
    (cl:cons ':header (header msg))
    (cl:cons ':bodies (bodies msg))
))
