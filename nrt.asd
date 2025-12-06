;;; nrt.asd
;;; SPDX-License-Identifier: BSD 3
;;; Copyright (C) 2025 NMunro [nmunro@duck.com]

(asdf:defsystem #:nrt
  :description "Ningle Response Toolkit"
  :author      "NMunro [nmunro@duck.com]"
  :license     "BSD 3"
  :version     "0.1.1"
  :depends-on  (:lack
                :ningle
                :djula)
  :serial t
  :components ((:file "src/util")
               (:file "src/status")
               (:file "src/backends")
               (:file "src/main")))
