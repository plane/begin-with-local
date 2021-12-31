# begin-with-local

This package allows you to write local definitions, scoped to the surrounding `begin`:

```scheme
(require begin-with-local)

(begin
  (local n 0)

  (define (count)
    (set! n (add1 n))
    n))

(count)   ;; => 1
(count)   ;; => 2

n         ;; doesn't work
```

This is syntactic sugar around [`splicing-let`](https://docs.racket-lang.org/reference/splicing.html) from [`racket/splicing`](https://docs.racket-lang.org/reference/splicing.html):

```scheme
(require racket/splicing)

(splicing-let ([n 0])
  (define (count)
    (set! n (add1 n))
    n))
```

Which is in turn similar to the let-over-lambda idiom:

```scheme
(define count
  (let ([n 0])
    (lambda ()
      (set! n (add1 n))
      n)))
```

You may also be interested in [`define/memo`](https://docs.racket-lang.org/memoize/index.html#%28form._%28%28lib._memoize%2Fmain..rkt%29._define%2Fmemo%29%29) from [`memoize`](https://docs.racket-lang.org/memoize/index.html), depending
on your use case.

## Installation

```sh
raco pkg install https://github.com/plane/begin-with-local.git#main
```
