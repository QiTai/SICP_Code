(define (square-list items)
	(define (iter things answer)
		(if (null? things)
			answer
			(iter (cdr things) 
				  (cons (square (car things)) answer))))
	(iter items '()))

(define (square-list items)
	(define (iter things answer)
		(if (null? things)
			answer
			(iter (cdr things)
				  (cons answer 
				  	    (square (car things))))))
	(iter items '()))

(define (square-list items)
	(define (iter items result)
		(if (null? items)
			(reverse result)
			(iter (cdr items) (cons (square (car items)) result))))
	(iter items '()))



