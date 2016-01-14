(define (add-rat x y)
	(make-rat (+ (* (numer x) (denom y))
			  	 (* (denom x) (numer y)))
			  (* (denom x) (denom y))))

(define (sub-rat x y)
	(make-rat (- (* (numer x) (denom y))
				 (* (denom x) (numer y)))
			  (* (denom x) (denom y))))

(define (mul-rat x y)
	(make-rat (* (numer x) (numer y))
			  (* (denom x) (denom y))))

(define (div-rat x y)
	(make-rat (* (numer x) (denom y))
		      (* (denom x) (numer y))))

(define (equal-rat? x y)
	(= (* (numer x) (denom y))
	   (* (numer y) (denom x))))

(define (make-rat n d)
	(let ((g (gcd n d)))
		(cons (/ n g) (/ d g))))

(define (numer x) 
	(let ((g (gcd (car x) (cdr x))))
		(/ (car x) g)))

(define (denom x) 
	(let ((g (gcd (car x) (cdr x))))
		(/ (cdr x) g)))

(define (print-rat x)
	(newline)
	(display (numer x))
	(display "/")
	(display (denom x)))

(define one-half (make-rat 1 2))

(define one-third (make-rat 1 3))

