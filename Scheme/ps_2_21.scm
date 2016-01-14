(define (square-list items)
	(if (null? items)
		'()
		(cons (square (car items)) (square-list (cdr items)))))

(define (map proc items)
	(if (null? items)
		'()
		(cons (proc (car items)) 
			  (map proc (cdr items)))))

(define (square-list items)
	(map square items))

(define (scale-list items factor)
	(map (lambda (x) (* x factor)) items))

