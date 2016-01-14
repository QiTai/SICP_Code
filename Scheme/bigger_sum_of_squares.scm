(define (bigger x y)
	(if (> x y)
		x
		y))

(define (smaller x y)
	(if (> x y)
		y
		x))

(define (sum_of_square x y)
	(+ (square x)
	   (square y)
	))

(define (bigger_sum_of_squares x y z)
	(sum_of_square (bigger x y)
					(bigger (smaller x y) z)))