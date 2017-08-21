; Auto-generated. Do not edit!


(cl:in-package optitrack-msg)


;//! \htmlinclude RigidBody.msg.html

(cl:defclass <RigidBody> (roslisp-msg-protocol:ros-message)
  ((id
    :reader id
    :initarg :id
    :type cl:integer
    :initform 0)
   (tracking_valid
    :reader tracking_valid
    :initarg :tracking_valid
    :type cl:boolean
    :initform cl:nil)
   (mrk_mean_error
    :reader mrk_mean_error
    :initarg :mrk_mean_error
    :type cl:float
    :initform 0.0)
   (pose
    :reader pose
    :initarg :pose
    :type geometry_msgs-msg:Pose
    :initform (cl:make-instance 'geometry_msgs-msg:Pose))
   (markers
    :reader markers
    :initarg :markers
    :type (cl:vector geometry_msgs-msg:Point)
   :initform (cl:make-array 0 :element-type 'geometry_msgs-msg:Point :initial-element (cl:make-instance 'geometry_msgs-msg:Point))))
)

(cl:defclass RigidBody (<RigidBody>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RigidBody>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RigidBody)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name optitrack-msg:<RigidBody> is deprecated: use optitrack-msg:RigidBody instead.")))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <RigidBody>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader optitrack-msg:id-val is deprecated.  Use optitrack-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'tracking_valid-val :lambda-list '(m))
(cl:defmethod tracking_valid-val ((m <RigidBody>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader optitrack-msg:tracking_valid-val is deprecated.  Use optitrack-msg:tracking_valid instead.")
  (tracking_valid m))

(cl:ensure-generic-function 'mrk_mean_error-val :lambda-list '(m))
(cl:defmethod mrk_mean_error-val ((m <RigidBody>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader optitrack-msg:mrk_mean_error-val is deprecated.  Use optitrack-msg:mrk_mean_error instead.")
  (mrk_mean_error m))

(cl:ensure-generic-function 'pose-val :lambda-list '(m))
(cl:defmethod pose-val ((m <RigidBody>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader optitrack-msg:pose-val is deprecated.  Use optitrack-msg:pose instead.")
  (pose m))

(cl:ensure-generic-function 'markers-val :lambda-list '(m))
(cl:defmethod markers-val ((m <RigidBody>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader optitrack-msg:markers-val is deprecated.  Use optitrack-msg:markers instead.")
  (markers m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RigidBody>) ostream)
  "Serializes a message object of type '<RigidBody>"
  (cl:let* ((signed (cl:slot-value msg 'id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'tracking_valid) 1 0)) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'mrk_mean_error))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pose) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'markers))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'markers))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RigidBody>) istream)
  "Deserializes a message object of type '<RigidBody>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'id) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:setf (cl:slot-value msg 'tracking_valid) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'mrk_mean_error) (roslisp-utils:decode-double-float-bits bits)))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pose) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'markers) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'markers)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'geometry_msgs-msg:Point))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RigidBody>)))
  "Returns string type for a message object of type '<RigidBody>"
  "optitrack/RigidBody")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RigidBody)))
  "Returns string type for a message object of type 'RigidBody"
  "optitrack/RigidBody")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RigidBody>)))
  "Returns md5sum for a message object of type '<RigidBody>"
  "8bb046602d710c6de10ba270a0a2080b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RigidBody)))
  "Returns md5sum for a message object of type 'RigidBody"
  "8bb046602d710c6de10ba270a0a2080b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RigidBody>)))
  "Returns full string definition for message of type '<RigidBody>"
  (cl:format cl:nil "# Optitrack rigid body~%int32                 id~%bool                  tracking_valid~%float64               mrk_mean_error~%geometry_msgs/Pose    pose~%geometry_msgs/Point[] markers~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of postion and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RigidBody)))
  "Returns full string definition for message of type 'RigidBody"
  (cl:format cl:nil "# Optitrack rigid body~%int32                 id~%bool                  tracking_valid~%float64               mrk_mean_error~%geometry_msgs/Pose    pose~%geometry_msgs/Point[] markers~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of postion and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RigidBody>))
  (cl:+ 0
     4
     1
     8
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pose))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'markers) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RigidBody>))
  "Converts a ROS message object to a list"
  (cl:list 'RigidBody
    (cl:cons ':id (id msg))
    (cl:cons ':tracking_valid (tracking_valid msg))
    (cl:cons ':mrk_mean_error (mrk_mean_error msg))
    (cl:cons ':pose (pose msg))
    (cl:cons ':markers (markers msg))
))
