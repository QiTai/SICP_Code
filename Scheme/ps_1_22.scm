(define (next_odd n)
	(if (odd? n)
		(+ 2 n)
		(+ 1 n)))

(define (prime? n)
	(= n (smallest_divisor n)))

(define (smallest_divisor n)
	(find_divisor n 2))

(define (find_divisor n test_divisor)
	(cond ((> test_divisor n) n)
		  ((divides? n test_divisor) test_divisor)
		  (else (find_divisor n (+ 1 test_divisor)))))

(define (divides? a b)
	(= 0 (remainder a b)))

(define (continue_prime n count)
	(cond ((= count 0) (display "all are primes"))
		  ((prime? n) 
		  	(display n) 
		  	(newline) 
		  	(continue_prime (next_odd n) (- count 1)))
		  (else
		  	(continue_prime (next_odd n) count))))


(define (search-for-primes n)
	(let ((start-time (real-time-clock)))
		(continue_prime n 3)
		(- (real-time-clock) start-time)))
