#lang racket/base

(provide local-function-definition
         local-definition)

(require syntax/parse)

(define-syntax-class local-function-definition
  #:description "Local function definition"
  (pattern ((~literal local)
            (name:id args:expr ...)
            body:expr ...)))

(define-syntax-class local-definition
  #:description "Local definition"
  (pattern ((~literal local)
            name:id
            value:expr)))

