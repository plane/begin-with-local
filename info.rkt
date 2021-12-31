#lang info

(define collection "begin-with-local")
(define pkg-authors '("crystal@panix.com"))
(define version "0.1")
#;(define scribblings '(("begin-with-local.scrbl" () (library) "begin-with-local")))
(define pkg-desc "Syntactic sugar for splicing-let")
(define deps '("base"))
(define build-deps '("racket-doc"
                     "scribble-lib"
                     "rackunit-lib"))
(define compile-omit-paths '("examples"))

