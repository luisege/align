; Auto-generated. Do not edit!


(cl:in-package align-msg)


;//! \htmlinclude align_params.msg.html

(cl:defclass <align_params> (roslisp-msg-protocol:ros-message)
  ((status
    :reader status
    :initarg :status
    :type cl:integer
    :initform 0)
   (go
    :reader go
    :initarg :go
    :type cl:integer
    :initform 0)
   (angle
    :reader angle
    :initarg :angle
    :type cl:float
    :initform 0.0)
   (tolerance
    :reader tolerance
    :initarg :tolerance
    :type cl:float
    :initform 0.0))
)

(cl:defclass align_params (<align_params>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <align_params>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'align_params)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name align-msg:<align_params> is deprecated: use align-msg:align_params instead.")))

(cl:ensure-generic-function 'status-val :lambda-list '(m))
(cl:defmethod status-val ((m <align_params>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader align-msg:status-val is deprecated.  Use align-msg:status instead.")
  (status m))

(cl:ensure-generic-function 'go-val :lambda-list '(m))
(cl:defmethod go-val ((m <align_params>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader align-msg:go-val is deprecated.  Use align-msg:go instead.")
  (go m))

(cl:ensure-generic-function 'angle-val :lambda-list '(m))
(cl:defmethod angle-val ((m <align_params>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader align-msg:angle-val is deprecated.  Use align-msg:angle instead.")
  (angle m))

(cl:ensure-generic-function 'tolerance-val :lambda-list '(m))
(cl:defmethod tolerance-val ((m <align_params>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader align-msg:tolerance-val is deprecated.  Use align-msg:tolerance instead.")
  (tolerance m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <align_params>) ostream)
  "Serializes a message object of type '<align_params>"
  (cl:let* ((signed (cl:slot-value msg 'status)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'go)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'angle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'tolerance))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <align_params>) istream)
  "Deserializes a message object of type '<align_params>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'status) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'go) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'angle) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'tolerance) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<align_params>)))
  "Returns string type for a message object of type '<align_params>"
  "align/align_params")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'align_params)))
  "Returns string type for a message object of type 'align_params"
  "align/align_params")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<align_params>)))
  "Returns md5sum for a message object of type '<align_params>"
  "b268fc20a4adf6788232295e116eea87")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'align_params)))
  "Returns md5sum for a message object of type 'align_params"
  "b268fc20a4adf6788232295e116eea87")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<align_params>)))
  "Returns full string definition for message of type '<align_params>"
  (cl:format cl:nil "int32 status~%int32 go~%float64 angle~%float64 tolerance~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'align_params)))
  "Returns full string definition for message of type 'align_params"
  (cl:format cl:nil "int32 status~%int32 go~%float64 angle~%float64 tolerance~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <align_params>))
  (cl:+ 0
     4
     4
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <align_params>))
  "Converts a ROS message object to a list"
  (cl:list 'align_params
    (cl:cons ':status (status msg))
    (cl:cons ':go (go msg))
    (cl:cons ':angle (angle msg))
    (cl:cons ':tolerance (tolerance msg))
))
