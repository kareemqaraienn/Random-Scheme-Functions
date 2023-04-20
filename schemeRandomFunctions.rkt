#lang scheme
;;question 1
(define (lowest-exponent base bound)
  (ceiling (expt bound (/ 1 base))))
(lowest-exponent 3 28)
(lowest-exponent 3 27)

;; Question 2
(define (find-abundant n)
  (if (<= n 11) 
    '()
    (if (<= (* n 2) (get-sum-divisors n 1))
      (cons n (find-abundant (- n 1)))
      (find-abundant (- n 1))
    )
  )
)
(define (get-sum-divisors n i)
  (if (> i n)
    0
    (if (eqv? (remainder n i) 0)
      (+ (get-sum-divisors n (+ 1 i)) i)
      (get-sum-divisors n (+ 1 i))
    )
  )
)
(find-abundant 25)
(find-abundant 26)




;;question 3

(define (make-string-list n)
  (cond
    ((eqv? n 0) '("Finished"))
    ((eqv? n 1) (cons "1 second" (make-string-list (- n 1))))
    (else (cons (format "~a seconds" n) (make-string-list (- n 1))))))
(make-string-list 3)
