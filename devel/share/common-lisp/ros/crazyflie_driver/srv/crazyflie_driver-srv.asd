
(cl:in-package :asdf)

(defsystem "crazyflie_driver-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :crazyflie_driver-msg
)
  :components ((:file "_package")
    (:file "UpdateParams" :depends-on ("_package_UpdateParams"))
    (:file "_package_UpdateParams" :depends-on ("_package"))
    (:file "AddCrazyflie" :depends-on ("_package_AddCrazyflie"))
    (:file "_package_AddCrazyflie" :depends-on ("_package"))
    (:file "RemoveCrazyflie" :depends-on ("_package_RemoveCrazyflie"))
    (:file "_package_RemoveCrazyflie" :depends-on ("_package"))
  ))