;;; backends.lisp
;;; SPDX-License-Identifier: BSD 3
;;; Copyright (C) 2025 NMunro [nmunro@duck.com]
(defpackage #:nrt/backends
  (:use #:cl))

(in-package #:nrt/backends)

(nrt/util:define-response-backend :json
    (lambda (data)
        (com.inuoe.jzon:stringify data))
    :default-headers '("Content-Type" "application/json"))

(nrt/util:define-response-backend :djula
  (lambda (body)
    (destructuring-bind (template &rest args) body
      (apply #'djula:render-template* template nil args)))
  :default-headers '("Content-Type" "text/html; charset=utf-8"))



