
(cl:in-package :asdf)

(defsystem "align-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "align_params" :depends-on ("_package_align_params"))
    (:file "_package_align_params" :depends-on ("_package"))
  ))