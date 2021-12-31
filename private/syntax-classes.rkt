#lang racket/base

(provide local-definition)

(require (for-syntax racket/base)
         (for-template racket/base)
         syntax/parse)

(define-syntax-class local-definition
  #:description "Local definition"
  #:datum-literals (local)

  (pattern (local name:id value:expr))

  (pattern (local (name:id args:expr ...)
             body:expr ...)

           #:attr value
             #'(λ (args ...)
                 body ...)))
