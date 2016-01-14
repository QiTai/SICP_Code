(define (filter predicate sequence)
	(cond ((null? sequence) '())
		  ((predicate (car sequence))
		  	(cons (car sequence) (filter predicate (cdr sequence))))
		  (else (filter predicate (cdr sequence)))))

(define (accumulate op initial sequence)
	(if (null? sequence)
		initial
		(op (car sequence) 
			(accumulate op initial (cdr sequence)))))

(define (enumerate-tree tree)
	(cond ((null? tree) '())
		((not (pair? tree)) (list tree))
		(else (append (enumerate-tree (car tree))
			          (enumerate-tree (cdr tree))))))

(define (sum-odd-squares tree)
	(accumulate +
			   	0
			   	(map square 
			   		(filter odd?
			   			(enumerate-tree tree)))))

(define (enumerate-interval low high)
	(if (> low high)
		'()
		(cons low (enumerate-interval (+ low 1) high))))

(define (even-fibs n)
	(accumulate cons 
		'()
		(filter even?
			(map fib 
				(enumerate-interval 0 n)))))


(define (fib n)
	(cond ((= n 0) 0)
		  ((= n 1) 1)
		  (else (+ (fib (- n 1)) 
		  	       (fib (- n 2))))))


(define (flatmap proc seq)
	(accumulate append '() (map proc seq)))

(define (prime-sum? pair)
	(prime? (+ (car pair) (cadr pair))))

(define (make-pair-sum pair)
	(list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(define (prime-sum-pairs n)
	(map make-pair-sum
		(filter prime-sum?
			(flatmap 
				(lambda (i) 
					(map (lambda (j) (list i j))
						(enumerate-interval 1 (- i 1))))
				(enumerate-interval 1 n)))))

(define (permutations s)
	(if (null? s)
		'()
		(flatmap (lambda (x)
					(map (lambda (p) (cons x p))
						(permutations (remove x s))))
				s)))

(define (remove item sequence)
	(filter (lambda (x) (not (= x item)))
		sequence))

