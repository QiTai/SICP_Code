;2_4_2.scm-------------------------------------------------------

(define (attach-tag type-tag contents)
	(cons type-tag contents))

(define (type-tag datum)
	(if (pair? datum)
		(car datum)
		(error "Bad tagged datum -- TYPE-TAG" datum)))

(define (contents datum)
	(if (pair? datum)
		(cdr datum)
		(error "Bad tagged datum -- CONTENTS" datum)))

(define (rectangular? z)
	(eq? (type-tag z) 'rectangular))

(define (polar? z)
	(eq? (type-tag z) 'polar))

(define (real-part-rectangular z) (car z))

(define (imag-part-rectangular z) (cdr z))

(define (magnitue-rectangular z) 
	(sqrt (+ (square (real-part-rectangular z)
			 (square (imag-part-rectangular z))))))

(define (angle-rectangular z)
	(atan (imag-part-rectangular z) 
		  (real-part-rectangular z)))

(define (make-from-real-imag-rectangular x y)
	(attach-tag 'rectangular (cons x y)))

(define (make-from-mag-ang-rectangular x y)
	(attach-tag 'rectangular 
		(cons (* r (cos a)) (* r (sin a)))))

(define (real-part-polar z)
	(* (magnitude-polar z) (cos (angle-polar z))))

(define (imag-part-polar z)
	(* (magnitude-polar z) (sin (angle-polar z))))

(define (magnitude-polar z)
	(car z))

(define (angle-polar z)
	(cdr z))

(define (make-from-real-imag-polar x y)
	(attach-tag 'polar (cons (sqrt (+ (square x) (square y))))))

(define (make-from-mag-ang-polar r a)
	(attach-tag 'polar (cons r a)))


(define (real-part z)
	(cond ((rectangular? z)
			(real-part-rectangular (contents z)))
		  ((polar? z)
		 	(real-part-polar (contents z)))
		  (else (error "Unknown type" z))))

