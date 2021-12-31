#lang racket/base

(provide local-function-definition
         local-definition)

(require (for-syntax racket/base)
         syntax/parse)

(define-syntax-class local-function-definition
  #:description "Local function definition"
  #:datum-literals (local)
  (pattern
   (local (name:id args:expr ...)
     body:expr ...)))

(define-syntax-class local-definition
  #:description "Local definition"
  #:datum-literals (local)  
  (pattern
   (local name:id value:expr)))

