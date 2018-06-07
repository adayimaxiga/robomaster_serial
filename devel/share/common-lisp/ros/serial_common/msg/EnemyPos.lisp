; Auto-generated. Do not edit!


(cl:in-package serial_common-msg)


;//! \htmlinclude EnemyPos.msg.html

(cl:defclass <EnemyPos> (roslisp-msg-protocol:ros-message)
  ((enemy_dist
    :reader enemy_dist
    :initarg :enemy_dist
    :type cl:integer
    :initform 0)
   (enemy_yaw
    :reader enemy_yaw
    :initarg :enemy_yaw
    :type cl:integer
    :initform 0)
   (enemy_pitch
    :reader enemy_pitch
    :initarg :enemy_pitch
    :type cl:integer
    :initform 0)
   (mode
    :reader mode
    :initarg :mode
    :type cl:integer
    :initform 0))
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

(cl:ensure-generic-function 'mode-val :lambda-list '(m))
(cl:defmethod mode-val ((m <EnemyPos>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_common-msg:mode-val is deprecated.  Use serial_common-msg:mode instead.")
  (mode m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <EnemyPos>) ostream)
  "Serializes a message object of type '<EnemyPos>"
  (cl:let* ((signed (cl:slot-value msg 'enemy_dist)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'enemy_yaw)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'enemy_pitch)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'mode)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <EnemyPos>) istream)
  "Deserializes a message object of type '<EnemyPos>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'enemy_dist) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'enemy_yaw) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'enemy_pitch) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'mode) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
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
  "d278822d8acfbc3aa6895b78b02afb89")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'EnemyPos)))
  "Returns md5sum for a message object of type 'EnemyPos"
  "d278822d8acfbc3aa6895b78b02afb89")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<EnemyPos>)))
  "Returns full string definition for message of type '<EnemyPos>"
  (cl:format cl:nil "int32 enemy_dist~%int32 enemy_yaw~%int32 enemy_pitch~%int32 mode ~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'EnemyPos)))
  "Returns full string definition for message of type 'EnemyPos"
  (cl:format cl:nil "int32 enemy_dist~%int32 enemy_yaw~%int32 enemy_pitch~%int32 mode ~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <EnemyPos>))
  (cl:+ 0
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <EnemyPos>))
  "Converts a ROS message object to a list"
  (cl:list 'EnemyPos
    (cl:cons ':enemy_dist (enemy_dist msg))
    (cl:cons ':enemy_yaw (enemy_yaw msg))
    (cl:cons ':enemy_pitch (enemy_pitch msg))
    (cl:cons ':mode (mode msg))
))
