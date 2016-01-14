(define (scale-list items factor)
	(if (null? items)
		nil
		(cons (* (car items) factor)
			  (scale-list (cdr items) factor))))

(define (map proc items)
	(if (null? items)
		nil
		(cons (proc (car items))
			  (map proc (cdr items)))))

(map abs (list -10 2.5 22.7 -12))

(define (scale-list items factor)
	(map (lambda (x) (* x factor))
		 items))

