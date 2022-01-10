; Auto-generated. Do not edit!


(cl:in-package msgs-msg)


;//! \htmlinclude controller.msg.html

(cl:defclass <controller> (roslisp-msg-protocol:ros-message)
  ((control_flag
    :reader control_flag
    :initarg :control_flag
    :type cl:boolean
    :initform cl:nil)
   (brake_flag
    :reader brake_flag
    :initarg :brake_flag
    :type cl:boolean
    :initform cl:nil)
   (gear_flag
    :reader gear_flag
    :initarg :gear_flag
    :type cl:boolean
    :initform cl:nil)
   (gear_to_set
    :reader gear_to_set
    :initarg :gear_to_set
    :type cl:fixnum
    :initform 0)
   (speed
    :reader speed
    :initarg :speed
    :type cl:float
    :initform 0.0)
   (acceleration
    :reader acceleration
    :initarg :acceleration
    :type cl:float
    :initform 0.0)
   (wheel_angle
    :reader wheel_angle
    :initarg :wheel_angle
    :type cl:float
    :initform 0.0))
)

(cl:defclass controller (<controller>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <controller>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'controller)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name msgs-msg:<controller> is deprecated: use msgs-msg:controller instead.")))

(cl:ensure-generic-function 'control_flag-val :lambda-list '(m))
(cl:defmethod control_flag-val ((m <controller>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader msgs-msg:control_flag-val is deprecated.  Use msgs-msg:control_flag instead.")
  (control_flag m))

(cl:ensure-generic-function 'brake_flag-val :lambda-list '(m))
(cl:defmethod brake_flag-val ((m <controller>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader msgs-msg:brake_flag-val is deprecated.  Use msgs-msg:brake_flag instead.")
  (brake_flag m))

(cl:ensure-generic-function 'gear_flag-val :lambda-list '(m))
(cl:defmethod gear_flag-val ((m <controller>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader msgs-msg:gear_flag-val is deprecated.  Use msgs-msg:gear_flag instead.")
  (gear_flag m))

(cl:ensure-generic-function 'gear_to_set-val :lambda-list '(m))
(cl:defmethod gear_to_set-val ((m <controller>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader msgs-msg:gear_to_set-val is deprecated.  Use msgs-msg:gear_to_set instead.")
  (gear_to_set m))

(cl:ensure-generic-function 'speed-val :lambda-list '(m))
(cl:defmethod speed-val ((m <controller>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader msgs-msg:speed-val is deprecated.  Use msgs-msg:speed instead.")
  (speed m))

(cl:ensure-generic-function 'acceleration-val :lambda-list '(m))
(cl:defmethod acceleration-val ((m <controller>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader msgs-msg:acceleration-val is deprecated.  Use msgs-msg:acceleration instead.")
  (acceleration m))

(cl:ensure-generic-function 'wheel_angle-val :lambda-list '(m))
(cl:defmethod wheel_angle-val ((m <controller>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader msgs-msg:wheel_angle-val is deprecated.  Use msgs-msg:wheel_angle instead.")
  (wheel_angle m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <controller>) ostream)
  "Serializes a message object of type '<controller>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'control_flag) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'brake_flag) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'gear_flag) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'gear_to_set)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'speed))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'acceleration))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'wheel_angle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <controller>) istream)
  "Deserializes a message object of type '<controller>"
    (cl:setf (cl:slot-value msg 'control_flag) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'brake_flag) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'gear_flag) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'gear_to_set)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'speed) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'acceleration) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'wheel_angle) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<controller>)))
  "Returns string type for a message object of type '<controller>"
  "msgs/controller")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'controller)))
  "Returns string type for a message object of type 'controller"
  "msgs/controller")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<controller>)))
  "Returns md5sum for a message object of type '<controller>"
  "8fa6cc1077b0e6ad3e8d031a45a0fd67")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'controller)))
  "Returns md5sum for a message object of type 'controller"
  "8fa6cc1077b0e6ad3e8d031a45a0fd67")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<controller>)))
  "Returns full string definition for message of type '<controller>"
  (cl:format cl:nil "bool control_flag~%~%bool brake_flag~%~%bool gear_flag~%~%uint8 gear_to_set~%~%float32 speed~%~%float32 acceleration~%~%float32 wheel_angle~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'controller)))
  "Returns full string definition for message of type 'controller"
  (cl:format cl:nil "bool control_flag~%~%bool brake_flag~%~%bool gear_flag~%~%uint8 gear_to_set~%~%float32 speed~%~%float32 acceleration~%~%float32 wheel_angle~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <controller>))
  (cl:+ 0
     1
     1
     1
     1
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <controller>))
  "Converts a ROS message object to a list"
  (cl:list 'controller
    (cl:cons ':control_flag (control_flag msg))
    (cl:cons ':brake_flag (brake_flag msg))
    (cl:cons ':gear_flag (gear_flag msg))
    (cl:cons ':gear_to_set (gear_to_set msg))
    (cl:cons ':speed (speed msg))
    (cl:cons ':acceleration (acceleration msg))
    (cl:cons ':wheel_angle (wheel_angle msg))
))
