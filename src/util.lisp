;;; util.lisp
;;; SPDX-License-Identifier: BSD 3
;;; Copyright (C) 2025 NMunro [nmunro@duck.com]
(defpackage nrt/util
  (:use #:cl)
  (:export #:*response-backends*
           #:define-response-backend))

(in-package nrt/util)

(defvar *response-backends* (make-hash-table)
  "Map backend kind (keywords like :JSON) to backend definitions.")

(defun define-response-backend (kind encoder &key default-headers)
  (check-type kind keyword)
  (check-type encoder function)
  (setf (gethash kind *response-backends*) (list :encoder encoder :default-headers default-headers))
  kind)
