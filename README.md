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

This is syntactic sugar around `splicing-let` from `racket/splicing`:

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

