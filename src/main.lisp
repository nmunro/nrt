;;; main.lisp
;;; SPDX-License-Identifier: BSD 3
;;; Copyright (C) 2025 NMunro [nmunro@duck.com]
(defpackage #:nrt
  (:use #:cl)
  (:export #:define-response-backend
           #:response))

(in-package #:nrt)

(defun %lookup-backend (kind)
  (or (gethash kind nrt/util:*response-backends*)
      (error "No backend registered for ~S" kind)))

(defun %set-headers (headers)
  (setf (lack.response:response-headers ningle:*response*) (append headers (lack.response:response-headers ningle:*response*))))

(defun %set-status (status)
  (setf (lack.response:response-status ningle:*response*) status))

(defun response (kind body &key (status 200) (headers nil))
  (let ((backend (%lookup-backend kind)))
    (%set-status status)
    (%set-headers (append (getf backend :default-headers) headers))
    (funcall (getf backend :encoder) body)))

