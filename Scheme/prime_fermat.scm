(define (even? a)
	(= 0 (remainder a 2)))
		 
(define (square x) (* x x))

(define (remainder a b) 
	(cond ((< a b) a)
		  (else (remainder (- a b) b))))

(define (remainder a b)
	(if (< a b) a 
		(remainder (- a b) b)))


(define (expmod base exp m)
	(cond ((= exp 0) 1)
		  ((even? exp)
		  	(remainder (square (expmod base (/ exp 2) m))
		  		m))
		  (else
		  	(remainder (* base (expmod base (- exp 1) m))
		  		m))))

(define (fermat_test n)
	(define (try_it a)
		(= (expmod a n n) a))
	(try_it (+ 1 (random (- n 1)))))

(define (fast_prime? n times)
	(cond ((= times 0) true)
		  ((fermat_test n) (fast_prime? n (- times 1)))
		  (else false)))