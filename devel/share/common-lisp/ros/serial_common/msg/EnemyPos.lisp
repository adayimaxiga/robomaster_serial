; Auto-generated. Do not edit!


(cl:in-package serial_common-msg)


;//! \htmlinclude EnemyPos.msg.html

(cl:defclass <EnemyPos> (roslisp-msg-protocol:ros-message)
  ((enemy_dist
    :reader enemy_dist
    :initarg :enemy_dist
    :type cl:float
    :initform 0.0)
   (enemy_yaw
    :reader enemy_yaw
    :initarg :enemy_yaw
    :type cl:float
    :initform 0.0)
   (enemy_pitch
    :reader enemy_pitch
    :initarg :enemy_pitch
    :type cl:float
    :initform 0.0))
)

(cl:defclass EnemyPos (<EnemyPos>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <EnemyPos>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'EnemyPos)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name serial_common-msg:<EnemyPos> is deprecated: use serial_common-msg:EnemyPos instead.")))

(cl:ensure-generic-function 'enemy_dist-val :lambda-list '(m))
(cl:defmethod enemy_dist-val ((m <EnemyPos>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_common-msg:enemy_dist-val is deprecated.  Use serial_common-msg:enemy_dist instead.")
  (enemy_dist m))

(cl:ensure-generic-function 'enemy_yaw-val :lambda-list '(m))
(cl:defmethod enemy_yaw-val ((m <EnemyPos>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_common-msg:enemy_yaw-val is deprecated.  Use serial_common-msg:enemy_yaw instead.")
  (enemy_yaw m))

(cl:ensure-generic-function 'enemy_pitch-val :lambda-list '(m))
(cl:defmethod enemy_pitch-val ((m <EnemyPos>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_common-msg:enemy_pitch-val is deprecated.  Use serial_common-msg:enemy_pitch instead.")
  (enemy_pitch m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <EnemyPos>) ostream)
  "Serializes a message object of type '<EnemyPos>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'enemy_dist))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'enemy_yaw))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'enemy_pitch))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <EnemyPos>) istream)
  "Deserializes a message object of type '<EnemyPos>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'enemy_dist) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'enemy_yaw) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'enemy_pitch) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<EnemyPos>)))
  "Returns string type for a message object of type '<EnemyPos>"
  "serial_common/EnemyPos")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'EnemyPos)))
  "Returns string type for a message object of type 'EnemyPos"
  "serial_common/EnemyPos")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<EnemyPos>)))
  "Returns md5sum for a message object of type '<EnemyPos>"
  "d2e463cd0aba84496a9caa0872b932d0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'EnemyPos)))
  "Returns md5sum for a message object of type 'EnemyPos"
  "d2e463cd0aba84496a9caa0872b932d0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<EnemyPos>)))
  "Returns full string definition for message of type '<EnemyPos>"
  (cl:format cl:nil "float64 enemy_dist~%float64 enemy_yaw~%float64 enemy_pitch~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'EnemyPos)))
  "Returns full string definition for message of type 'EnemyPos"
  (cl:format cl:nil "float64 enemy_dist~%float64 enemy_yaw~%float64 enemy_pitch~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <EnemyPos>))
  (cl:+ 0
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <EnemyPos>))
  "Converts a ROS message object to a list"
  (cl:list 'EnemyPos
    (cl:cons ':enemy_dist (enemy_dist msg))
    (cl:cons ':enemy_yaw (enemy_yaw msg))
    (cl:cons ':enemy_pitch (enemy_pitch msg))
))
