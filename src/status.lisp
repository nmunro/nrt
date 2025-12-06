;;; status.lisp
;;; SPDX-License-Identifier: BSD 3
;;; Copyright (C) 2025 NMunro [nmunro@duck.com]
(defpackage #:nrt/http-status
  (:use #:cl)
  (:exports ;; 1XX
            #:CONTINUE
            #:SWITCHING-PROTOCOLS
            #:PROCESSING
            #:EARLY-HINTS

            ;; 2XX
            #:OK
            #:CREATED
            #:ACCEPTED
            #:NON-AUTHORITIVE-INFORMATION
            #:NO-CONTENT
            #:RESET-CONTENT
            #:PARIAL-CONTENT
            #:MULTI-STATUS
            #:ALREADY-REPORTED
            #:IM-USED

            ;; 3XX
            #:MULTIPLE-CHOICES
            #:MOVED-PERMANENTLY
            #:FOUND
            #:SEE-OTHER
            #:NOT-MODIFIED
            #:USE-PROXY
            #:SWITCH-PROXY
            #:TEMPORARY-REDIRECT
            #:PERMANENTLY-REDIRECT
            
            ;; 4XX
            #:BAD-REQUEST
            #:UNAUTHORIZED
            #:PAYMENT-REQUIRED
            #:FORBIDDEN
            #:NOT-FOUND
            #:METHOD-NOT-ALLOWED
            #:NOT-ACCEPTABLE
            #:PROXY-AUTHENTICATION-FAILED
            #:REQUEST-TIMEOUT
            #:CONFLICT
            #:GONE
            #:LENGTH-REQUIRED
            #:PRECONDITION-FAILED
            #:PAYLOAD-TOO-LARGE
            #:URI-TOO-LONG
            #:UNSUPPORTED-MEDIA-TYPE
            #:RANGE-NOT-SATISFIABLE
            #:EXPECTATION-FAILED
            #:IM-A-TEAPOT
            #:MISDIRECTED-REQUEST
            #:UNPROCESSABLE-CONTENT
            #:LOCKED
            #:FAILED-DEPENDENCY
            #:TOO-EARLY
            #:UPGRADE-REQUIRED
            #:PRECONDITION-REQUIRED
            #:TOO-MANY-REQUESTS
            #:REQUEST-HEADER-FIELDS-TOO-LARGE
            #:UNAVAILABLE-FOR-LEGAL-REASONS

            ;; 5XX
            #:INTERNAL-SERVER-ERROR
            #:NOT-IMPLEMENTED
            #:BAD-GATEWAY
            #:SERVICE-UNAVAILABLE
            #:GATEWAY-TIMEOUT
            #:HTTP-VERSION-NOT-SUPPORTED
            #:VARIANT-ALSO-NEGOTIATES
            #:INSUFFICIENT-STORAGE
            #:LOOP-DETECTED
            #:NOT-EXTENDED
            #:FURTHER-AUTHENTICATION-REQUIRED))

(in-package nrt/http-status)

(defparameter CONTINUE 100)
(defparameter SWITCHING-PROTOCOLS 101)
(defparameter PROCESSING 102)
(defparameter EARLY-HINTS 103)

(defparameter OK 200)
(defparameter CREATED 201)
(defparameter ACCEPTED 202)
(defparameter NON-AUTHORITIVE-INFORMATION 203)
(defparameter NO-CONTENT 204)
(defparameter RESET-CONTENT 205)
(defparameter PARTIAL-CONTENT 206)
(defparameter MULTI-STATUS 207)
(defparameter ALREADY-REPORTED 208)
(defparameter IM-USED 226)

(defparameter MULTIPLE-CHOICES 300)
(defparameter MOVED-PERMANENTLY 301)
(defparameter FOUND 302)
(defparameter SEE-OTHER 303)
(defparameter NOT-MODIFIED 304)
(defparameter USE-PROXY 305)
(defparameter SWITCH-PROXY 306)
(defparameter TEMPORARY-REDIRECT 307)
(defparameter PERMANENT-REDIRECT 308)

(defparameter BAD-REQUEST 400)
(defparameter UNAUTHORIZED 401)
(defparameter PAYMENT-REQUIRED 402)
(defparameter FORBIDDEN 403)
(defparameter NOT-FOUND 404)
(defparameter METHOD-NOT-ALLOWED 405)
(defparameter NOT-ACCEPTABLE 406)
(defparameter PROXY-AUTHENTICATION-FAILED 407)
(defparameter REQUEST-TIMEOUT 408)
(defparameter CONFLICT 409)
(defparameter GONE 410)
(defparameter LENGTH-REQUIRED 411)
(defparameter PRECONDITION-FAILED 412)
(defparameter PAYLOAD-TOO-LARGE 413)
(defparameter URI-TOO-LONG 414)
(defparameter UNSUPPORTED-MEDIA-TYPE 415)
(defparameter RANGE-NOT-SATISFIABLE 416)
(defparameter EXPECTATION-FAILED 417)
(defparameter IM-A-TEAPOT 418)
(defparameter MISDIRECTED-REQUEST 421)
(defparameter UNPROCESSABLE-CONTENT 422)
(defparameter LOCKED 423)
(defparameter FAILED-DEPENDENCY 424)
(defparameter TOO-EARLY 425)
(defparameter UPGRADE-REQUIRED 426)
(defparameter PRECONDITION-REQUIRED 428)
(defparameter TOO-MANY-REQUESTS 429)
(defparameter REQUEST-HEADER-FIELDS-TOO-LARGE 431)
(defparameter UNAVAILABLE-FOR-LEGAL-REASONS 451)

(defparameter INTERNAL-SERVER-ERROR 500)
(defparameter NOT-IMPLEMENTED 501)
(defparameter BAD-GATEWAY 502)
(defparameter SERVICE-UNAVAILABLE 503)
(defparameter GATEWAY-TIMEOUT 504)
(defparameter HTTP-VERSION-NOT-SUPPORTED 505)
(defparameter VARIANT-ALSO-NEGOTIATES 506)
(defparameter INSUFFICIENT-STORAGE 507)
(defparameter LOOP-DETECTED 508)
(defparameter NOT-EXTENDED 510)
(defparameter FURTHER-AUTHENTICATION-REQUIRED 511)
