#lang info

(define collection "begin-with-local")
(define pkg-authors '("crystal@panix.com"))
(define version "0.1")
#;(define scribblings '(("begin-with-local.scrbl" () (library) "begin-with-local")))
(define pkg-desc "(let [x 0 y 1] body ...) macro")
(define deps '("base"))
(define build-deps '("racket-doc"
                     "scribble-lib"))
(define compile-omit-paths '("examples"))

