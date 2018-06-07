; Auto-generated. Do not edit!


(cl:in-package serial_common-msg)


;//! \htmlinclude Infantrymode.msg.html

(cl:defclass <Infantrymode> (roslisp-msg-protocol:ros-message)
  ((mode
    :reader mode
    :initarg :mode
    :type cl:integer
    :initform 0))
)

(cl:defclass Infantrymode (<Infantrymode>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Infantrymode>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Infantrymode)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name serial_common-msg:<Infantrymode> is deprecated: use serial_common-msg:Infantrymode instead.")))

(cl:ensure-generic-function 'mode-val :lambda-list '(m))
(cl:defmethod mode-val ((m <Infantrymode>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_common-msg:mode-val is deprecated.  Use serial_common-msg:mode instead.")
  (mode m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Infantrymode>) ostream)
  "Serializes a message object of type '<Infantrymode>"
  (cl:let* ((signed (cl:slot-value msg 'mode)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Infantrymode>) istream)
  "Deserializes a message object of type '<Infantrymode>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'mode) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Infantrymode>)))
  "Returns string type for a message object of type '<Infantrymode>"
  "serial_common/Infantrymode")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Infantrymode)))
  "Returns string type for a message object of type 'Infantrymode"
  "serial_common/Infantrymode")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Infantrymode>)))
  "Returns md5sum for a message object of type '<Infantrymode>"
  "ff63f6ea3c3e9b7504b2cb3ee0a09d92")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Infantrymode)))
  "Returns md5sum for a message object of type 'Infantrymode"
  "ff63f6ea3c3e9b7504b2cb3ee0a09d92")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Infantrymode>)))
  "Returns full string definition for message of type '<Infantrymode>"
  (cl:format cl:nil "int32 mode~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Infantrymode)))
  "Returns full string definition for message of type 'Infantrymode"
  (cl:format cl:nil "int32 mode~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Infantrymode>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Infantrymode>))
  "Converts a ROS message object to a list"
  (cl:list 'Infantrymode
    (cl:cons ':mode (mode msg))
))
