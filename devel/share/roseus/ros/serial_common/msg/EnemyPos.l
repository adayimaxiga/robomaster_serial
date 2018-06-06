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
  :slots (_enemy_dist _enemy_yaw _enemy_pitch ))

(defmethod serial_common::EnemyPos
  (:init
   (&key
    ((:enemy_dist __enemy_dist) 0.0)
    ((:enemy_yaw __enemy_yaw) 0.0)
    ((:enemy_pitch __enemy_pitch) 0.0)
    )
   (send-super :init)
   (setq _enemy_dist (float __enemy_dist))
   (setq _enemy_yaw (float __enemy_yaw))
   (setq _enemy_pitch (float __enemy_pitch))
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
  (:serialization-length
   ()
   (+
    ;; float64 _enemy_dist
    8
    ;; float64 _enemy_yaw
    8
    ;; float64 _enemy_pitch
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _enemy_dist
       (sys::poke _enemy_dist (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _enemy_yaw
       (sys::poke _enemy_yaw (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _enemy_pitch
       (sys::poke _enemy_pitch (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _enemy_dist
     (setq _enemy_dist (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _enemy_yaw
     (setq _enemy_yaw (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _enemy_pitch
     (setq _enemy_pitch (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get serial_common::EnemyPos :md5sum-) "d2e463cd0aba84496a9caa0872b932d0")
(setf (get serial_common::EnemyPos :datatype-) "serial_common/EnemyPos")
(setf (get serial_common::EnemyPos :definition-)
      "float64 enemy_dist
float64 enemy_yaw
float64 enemy_pitch

")



(provide :serial_common/EnemyPos "d2e463cd0aba84496a9caa0872b932d0")


