;; Auto-generated. Do not edit!


(when (boundp 'serial_common::EnemyPos)
  (if (not (find-package "SERIAL_COMMON"))
    (make-package "SERIAL_COMMON"))
  (shadow 'EnemyPos (find-package "SERIAL_COMMON")))
(unless (find-package "SERIAL_COMMON::ENEMYPOS")
  (make-package "SERIAL_COMMON::ENEMYPOS"))

(in-package "ROS")
;;//! \htmlinclude EnemyPos.msg.html


(defclass serial_common::EnemyPos
  :super ros::object
  :slots (_enemy_dist _enemy_yaw _enemy_pitch _mode ))

(defmethod serial_common::EnemyPos
  (:init
   (&key
    ((:enemy_dist __enemy_dist) 0)
    ((:enemy_yaw __enemy_yaw) 0)
    ((:enemy_pitch __enemy_pitch) 0)
    ((:mode __mode) 0)
    )
   (send-super :init)
   (setq _enemy_dist (round __enemy_dist))
   (setq _enemy_yaw (round __enemy_yaw))
   (setq _enemy_pitch (round __enemy_pitch))
   (setq _mode (round __mode))
   self)
  (:enemy_dist
   (&optional __enemy_dist)
   (if __enemy_dist (setq _enemy_dist __enemy_dist)) _enemy_dist)
  (:enemy_yaw
   (&optional __enemy_yaw)
   (if __enemy_yaw (setq _enemy_yaw __enemy_yaw)) _enemy_yaw)
  (:enemy_pitch
   (&optional __enemy_pitch)
   (if __enemy_pitch (setq _enemy_pitch __enemy_pitch)) _enemy_pitch)
  (:mode
   (&optional __mode)
   (if __mode (setq _mode __mode)) _mode)
  (:serialization-length
   ()
   (+
    ;; int32 _enemy_dist
    4
    ;; int32 _enemy_yaw
    4
    ;; int32 _enemy_pitch
    4
    ;; int32 _mode
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _enemy_dist
       (write-long _enemy_dist s)
     ;; int32 _enemy_yaw
       (write-long _enemy_yaw s)
     ;; int32 _enemy_pitch
       (write-long _enemy_pitch s)
     ;; int32 _mode
       (write-long _mode s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _enemy_dist
     (setq _enemy_dist (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _enemy_yaw
     (setq _enemy_yaw (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _enemy_pitch
     (setq _enemy_pitch (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _mode
     (setq _mode (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get serial_common::EnemyPos :md5sum-) "d278822d8acfbc3aa6895b78b02afb89")
(setf (get serial_common::EnemyPos :datatype-) "serial_common/EnemyPos")
(setf (get serial_common::EnemyPos :definition-)
      "int32 enemy_dist
int32 enemy_yaw
int32 enemy_pitch
int32 mode 

")



(provide :serial_common/EnemyPos "d278822d8acfbc3aa6895b78b02afb89")


