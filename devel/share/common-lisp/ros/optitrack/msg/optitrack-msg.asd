
(cl:in-package :asdf)

(defsystem "optitrack-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "RigidBody" :depends-on ("_package_RigidBody"))
    (:file "_package_RigidBody" :depends-on ("_package"))
    (:file "RigidBodyArray" :depends-on ("_package_RigidBodyArray"))
    (:file "_package_RigidBodyArray" :depends-on ("_package"))
  ))