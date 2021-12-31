#lang racket/base

(provide local-definition)

(require (for-syntax racket/base)
         syntax/parse)

(define-syntax-class local-definition
  #:description "Local definition"
  #:datum-literals (local)
  (pattern
   (local (name:id args:expr ...)
     body:expr ...)
   #:with value #'(λ (args ...)
                    body ...))
  (pattern
   (local name:id value:expr)))

