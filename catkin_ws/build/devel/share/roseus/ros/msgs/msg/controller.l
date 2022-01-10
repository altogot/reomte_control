;; Auto-generated. Do not edit!


(when (boundp 'msgs::controller)
  (if (not (find-package "MSGS"))
    (make-package "MSGS"))
  (shadow 'controller (find-package "MSGS")))
(unless (find-package "MSGS::CONTROLLER")
  (make-package "MSGS::CONTROLLER"))

(in-package "ROS")
;;//! \htmlinclude controller.msg.html


(defclass msgs::controller
  :super ros::object
  :slots (_control_flag _brake_flag _gear_flag _gear_to_set _speed _acceleration _wheel_angle ))

(defmethod msgs::controller
  (:init
   (&key
    ((:control_flag __control_flag) nil)
    ((:brake_flag __brake_flag) nil)
    ((:gear_flag __gear_flag) nil)
    ((:gear_to_set __gear_to_set) 0)
    ((:speed __speed) 0.0)
    ((:acceleration __acceleration) 0.0)
    ((:wheel_angle __wheel_angle) 0.0)
    )
   (send-super :init)
   (setq _control_flag __control_flag)
   (setq _brake_flag __brake_flag)
   (setq _gear_flag __gear_flag)
   (setq _gear_to_set (round __gear_to_set))
   (setq _speed (float __speed))
   (setq _acceleration (float __acceleration))
   (setq _wheel_angle (float __wheel_angle))
   self)
  (:control_flag
   (&optional (__control_flag :null))
   (if (not (eq __control_flag :null)) (setq _control_flag __control_flag)) _control_flag)
  (:brake_flag
   (&optional (__brake_flag :null))
   (if (not (eq __brake_flag :null)) (setq _brake_flag __brake_flag)) _brake_flag)
  (:gear_flag
   (&optional (__gear_flag :null))
   (if (not (eq __gear_flag :null)) (setq _gear_flag __gear_flag)) _gear_flag)
  (:gear_to_set
   (&optional __gear_to_set)
   (if __gear_to_set (setq _gear_to_set __gear_to_set)) _gear_to_set)
  (:speed
   (&optional __speed)
   (if __speed (setq _speed __speed)) _speed)
  (:acceleration
   (&optional __acceleration)
   (if __acceleration (setq _acceleration __acceleration)) _acceleration)
  (:wheel_angle
   (&optional __wheel_angle)
   (if __wheel_angle (setq _wheel_angle __wheel_angle)) _wheel_angle)
  (:serialization-length
   ()
   (+
    ;; bool _control_flag
    1
    ;; bool _brake_flag
    1
    ;; bool _gear_flag
    1
    ;; uint8 _gear_to_set
    1
    ;; float32 _speed
    4
    ;; float32 _acceleration
    4
    ;; float32 _wheel_angle
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _control_flag
       (if _control_flag (write-byte -1 s) (write-byte 0 s))
     ;; bool _brake_flag
       (if _brake_flag (write-byte -1 s) (write-byte 0 s))
     ;; bool _gear_flag
       (if _gear_flag (write-byte -1 s) (write-byte 0 s))
     ;; uint8 _gear_to_set
       (write-byte _gear_to_set s)
     ;; float32 _speed
       (sys::poke _speed (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _acceleration
       (sys::poke _acceleration (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _wheel_angle
       (sys::poke _wheel_angle (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _control_flag
     (setq _control_flag (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _brake_flag
     (setq _brake_flag (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _gear_flag
     (setq _gear_flag (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; uint8 _gear_to_set
     (setq _gear_to_set (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float32 _speed
     (setq _speed (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _acceleration
     (setq _acceleration (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _wheel_angle
     (setq _wheel_angle (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get msgs::controller :md5sum-) "8fa6cc1077b0e6ad3e8d031a45a0fd67")
(setf (get msgs::controller :datatype-) "msgs/controller")
(setf (get msgs::controller :definition-)
      "bool control_flag

bool brake_flag

bool gear_flag

uint8 gear_to_set

float32 speed

float32 acceleration

float32 wheel_angle
")



(provide :msgs/controller "8fa6cc1077b0e6ad3e8d031a45a0fd67")


