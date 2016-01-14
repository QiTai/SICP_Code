(define balance 100)

(define (withdraw amount)
	(if (>= balance amount)
		(begin (set! balance (- balance amount))
			balance)
		"Insufficient funds"))

(define new-withdraw
	(let ((balance 100))
		(lambda (amount) 
			(if (>= balance amount)
				(begin (set! balance (- balance amount))
					balance)
				"Insufficient funds"))))

(define (make-account balance)
	(define (withdraw amount)
		(if (>= balance amount)
			(begin (set! balance (- balance amount))
				balance)
			"Insufficient funds"))
	(define (deposit amount)
		(set! balance (+ balance amount)))
	(define (dispatch m)
		(cond ((eq? m 'withdraw) withdraw)
			  ((eq? m 'deposit) deposit)
			  (else (error "Unknow request -- MAKE-ACCOUNT" m))))
	dispatch)

(define acc (make-account 100))

((acc 'withdraw) 60)



