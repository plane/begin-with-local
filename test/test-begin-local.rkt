#lang racket/base

(require begin-with-local)

(module+ test
  (require rackunit
           syntax/macro-testing))

(begin
  (local (odd-step n) (+ (* 3 n) 1))
  (local (even-step n) (/ n 2))
  (local (step n)
    (cond [(even? n) (even-step n)]
          [(odd? n) (odd-step n)]))
  (define (count-steps n)
    (cond [(= 1 n) 0]
          [else (add1 (count-steps (step n)))])))

(module+ test
  (check-equal? (count-steps 1) 0)
  (check-equal? (count-steps 2) 1)
  (check-equal? (count-steps 4) 2)
  (check-equal? (count-steps 8) 3)
  (check-equal? (count-steps 16) 4)
  (check-equal? (count-steps 5) 5)
  (check-equal? (count-steps 32) 5)
  (check-equal? (count-steps 10) 6)
  (check-equal? (count-steps 64) 6)
  (check-equal? (count-steps 3) 7)
  (check-equal? (count-steps 20) 7)
  (check-equal? (count-steps 21) 7)
  (check-equal? (count-steps 128) 7)
  (check-equal? (count-steps 6) 8)
  (check-equal? (count-steps 40) 8)
  (check-equal? (count-steps 42) 8)
  (check-equal? (count-steps 256) 8)

  (test-case "local definitions undefined outside"
    (check-exn #rx"^odd-step: unbound identifier$"
               (λ () (convert-syntax-error odd-step)))
    (check-exn #rx"^even-step: unbound identifier$"
               (λ () (convert-syntax-error even-step)))
    (check-exn #rx"^step: unbound identifier$"
               (λ () (convert-syntax-error step)))))
