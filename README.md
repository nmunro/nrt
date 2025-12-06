# Nrt: Ningle Response Toolkit

A tiny helper layer for [Ningle](https://8arrow.org/ningle/) that makes responses predictable. `nrt` centralizes encoding, headers, and status codes so handlers can stay focused on business logic.

## What it gives you
- Built-in JSON and Djula renderers with sensible `Content-Type` defaults.
- One `response` helper that sets the HTTP status, merges headers, and encodes the body.
- A package of HTTP status constants (`nrt/http-status`) to avoid magic numbers.
- A simple hook (`define-response-backend`) to add new output formats.

## Loading

`nrt` is an ASDF system; drop it in `~/quicklisp/local-projects/` and load it like any other dependency:

```lisp
(ql:quickload :nrt)
```

or

```lisp
(asdf:load-system :nrt)
```

## Quick start (Ningle)

```lisp
(defpackage #:my-app
  (:use #:cl #:ningle)
  (:import-from #:nrt #:response)
  (:local-nicknames (#:status #:nrt/http-status)))

(in-package #:my-app)

;; JSON response with status and extra header
(setf (gethash "/health" *app*)
      (lambda (params)
        (declare (ignore params))
        (response :json '((ok . t))
                  :status status:OK
                  :headers '("Cache-Control" "no-store"))))

;; Djula render (template plus render args)
(setf (gethash "/welcome" *app*)
      (lambda (params)
        (declare (ignore params))
        (response :djula (list "templates/welcome.html"
                               :user "Ada")
                  :status status:OK)))
```

## Adding your own backend

If you need a different format, register it once and call it by keyword:

```lisp
(nrt/util:define-response-backend :plain
  (lambda (body) body)
  :default-headers '("Content-Type" "text/plain; charset=utf-8"))

(response :plain "Hello, world" :status nrt/http-status:OK)
```

`define-response-backend` stores an encoder function plus optional default headers. `response` looks up the backend, sets the status, merges headers (backend defaults first, then any you pass), and returns the encoded body for Ningle.

## Status helpers

HTTP status codes live in `nrt/http-status` (e.g., `status:OK`, `status:NOT-FOUND`, `status:INTERNAL-SERVER-ERROR`). Import or nickname that package to keep handlers readable.

## Author and License

`nrt` was written by [NMunro](mailto:nmunro@duck.com) and is distributed under the terms of the BSD-3 license.
