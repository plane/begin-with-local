#lang racket/base

(provide (rename-out [my-begin begin]))

(require (for-syntax racket/base
                     "private/syntax-classes.rkt")
         racket/splicing
         syntax/parse/define)

(define-syntax-parser my-begin
  #:track-literals

  [(_ func:local-function-definition rest:expr ...)
   #'(splicing-let ([func.name
                     (λ (func.args ...)
                       func.body ...)])
       (my-begin rest ...))]

  [(_ val:local-definition rest:expr ...)
   #'(splicing-let ([val.name val.value])
       (my-begin rest ...))]

  [(_ e:expr rest:expr ...)
   #'(begin
       e
       (my-begin rest ...))]

  [(_)
   #'(begin)])

