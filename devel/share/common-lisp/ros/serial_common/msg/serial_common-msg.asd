
(cl:in-package :asdf)

(defsystem "serial_common-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "EnemyPos" :depends-on ("_package_EnemyPos"))
    (:file "_package_EnemyPos" :depends-on ("_package"))
  ))