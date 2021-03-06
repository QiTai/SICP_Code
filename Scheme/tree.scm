(define x (cons (list 1 2) (list 3 4)))

(length x)

(length x)

(define (count-leave x)
	(cond ((null? x) 0)
		  ((not (pair? x)) 1)
		  (else (+ (count-leave (car x)) 
		  	       (count-leave (cdr x))))))

(define (scale-tree tree factor)
	(cond ((null? tree) '())
		  ((not (pair? tree)) (* tree factor))
		  (else (cons (scale-tree (car tree) factor)
		  	          (scale-tree (cdr tree) factor)))))

(define (scale-tree tree factor)
	(map (lambda (sub-tree)
		(if (pair? sub-tree)
			(scale-tree sub-tree factor)
			(* sub-tree factor)))
	tree))

(define (sum-odd-squares tree)
	(cond ((null? tree) 0)
		  ((not (pair? tree)) 
		  	(if (odd? tree) (square tree) 0))
		  (else (+ (sum-odd-squares (car tree))
		  	       (sum-odd-squares (cdr tree))))))

(define (even-fibs n)
	(define (next k)
		(if (> k n)
			'()
			(let ((f (fib k)))
				 (if (even? f)
				 	(cons f (next (+ k 1)))
				 	(next (+ k 1))))))
	(next 0))