;; Auto-generated. Do not edit!


(when (boundp 'serial_common::Infantrymode)
  (if (not (find-package "SERIAL_COMMON"))
    (make-package "SERIAL_COMMON"))
  (shadow 'Infantrymode (find-package "SERIAL_COMMON")))
(unless (find-package "SERIAL_COMMON::INFANTRYMODE")
  (make-package "SERIAL_COMMON::INFANTRYMODE"))

(in-package "ROS")
;;//! \htmlinclude Infantrymode.msg.html


(defclass serial_common::Infantrymode
  :super ros::object
  :slots (_mode ))

(defmethod serial_common::Infantrymode
  (:init
   (&key
    ((:mode __mode) 0)
    )
   (send-super :init)
   (setq _mode (round __mode))
   self)
  (:mode
   (&optional __mode)
   (if __mode (setq _mode __mode)) _mode)
  (:serialization-length
   ()
   (+
    ;; int32 _mode
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _mode
       (write-long _mode s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _mode
     (setq _mode (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get serial_common::Infantrymode :md5sum-) "ff63f6ea3c3e9b7504b2cb3ee0a09d92")
(setf (get serial_common::Infantrymode :datatype-) "serial_common/Infantrymode")
(setf (get serial_common::Infantrymode :definition-)
      "int32 mode
")



(provide :serial_common/Infantrymode "ff63f6ea3c3e9b7504b2cb3ee0a09d92")


