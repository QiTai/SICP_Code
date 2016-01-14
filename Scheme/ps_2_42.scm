(define (queens board-size)
	(define (queen-cols k)
		(if (= k 0)
			(list empty-board)
			(filter 
				(lambda (positions) (safe? k positions))
				(flatmap
					(lambda (rest-of-queens)
						(map (lambda (new-row)
							(adjoin-position new-row k rest-of-queens))
						(enumerate-interval 1 board-size)))
					(queen-cols (- k 1))))))
	(queen-cols board-size))

(define empty-board '())

(define (adjoin-position new-row k rest-of-queens)
	(cons new-row rest-of-queens))

(define (safe? k position)
	(iter-check (car position)
				(cdr position)
				1))

(define (iter-check row-of-the-new-queen rest-of-queens i)
	(if (null? rest-of-queens)
		#t 
		(let ((row-of-the-current-queen (car rest-of-queens)))
			(if (or (= row-of-the-new-queen row-of-the-current-queen)     ;行碰撞
				    (= row-of-the-new-queen (+ i row-of-the-current-queen)) ;
				    (= row-of-the-new-queen (- row-of-the-current-queen i)))
				#f 
				(iter-check row-of-the-new-queen
					(cdr rest-of-queens)
					(+ i 1)))))) 


(define (enumerate-interval low high)
	(if (> low high)
		'()
		(cons low (enumerate-interval (+ low + 1) high))))

(define (flatmap proc seq)
	(accumulate append '() (map proc seq)))

(define (accumulate op initial sequence)
	(if (null? sequence)
		initial 
		(op (car sequence)
			(accumulate op initial (cdr sequence)))))

