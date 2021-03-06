#lang racket/base

(provide (rename-out [my-begin begin]))

(require (for-syntax racket/base
                     "private/syntax-classes.rkt")
         racket/splicing
         syntax/parse/define)

(define-syntax-parser my-begin
  #:track-literals

  [(_ val:local-definition rest:expr ...)
   #'(splicing-let ([val.name val.value])
       (my-begin rest ...))]

  [(_ e:expr rest:expr ...+)
   #'(begin
       e
       (my-begin rest ...))]

  [(_ e:expr)
   #'e]

  [(_)
   #'(begin)])

