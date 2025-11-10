;;; main.lisp
;;; SPDX-License-Identifier: BSD 3
;;; Copyright (C) 2025 NMunro [nmunro@duck.com]
(defpackage #:nrt
  (:use #:cl)
  (:export #:define-response-backend
           #:with-response))

(in-package #:nrt)

(defparameter *backends* (make-hash-table :test 'equal))

(defstruct response-backend
  encoder
  default-headers)

(defun %apply-headers (headers)
  (setf (lack.response:response-headers lack.response:*response*)
        (append headers (lack.response:response-headers lack.response:*response*))))

(defun define-response-backend (key encoder default-headers)
  (setf (gethash key *response-backends*)
        (make-response-backend
         :encoder encoder
         :default-headers default-headers)))

(defmacro with-response ((kind status &key (headers '())) &body body)
  (let ((g-data    (gensym "DATA"))
        (g-backend (gensym "BACKEND")))
    `(let* ((,g-data (progn ,@body))
            (,g-backend (or (gethash ,kind *response-backends*) (error "Unknown response backend: ~S" ,kind)))
            (encoder         (response-backend-encoder ,g-backend))
            (default-headers (response-backend-default-headers ,g-backend)))
       (setf (lack.response:response-status lack.response:*response*) ,status)
       (%apply-headers (append default-headers ,headers))
       (funcall encoder ,g-data))))
