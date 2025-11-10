;;; nrt.asd
;;; SPDX-License-Identifier: BSD 3
;;; Copyright (C) 2025 NMunro [nmunro@duck.com]

(asdf:defsystem #:nrt
  :description "A basic application."
  :author      "NMunro [nmunro@duck.com]"
  :license     "BSD 3"
  :version     "0.1.0"
  :depends-on  (:lack
                :ningle)
  :serial t
  :components ((:file "src/main")))
