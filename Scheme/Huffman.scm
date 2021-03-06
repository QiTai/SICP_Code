(define (make-leaf symbol weight)
	(list 'leaf symbol weight))

(define (leaf? object)
	(eq? (car object) 'leaf))

(define (symbol-leaf x) (cadr x))

(define (weight-leaf x) (caddr x))

(define (make-code-tree left right)
	(list left 
		right
		(append (symbol left) (symbol right))
		(+ (weight left) (weight right))))

(define (left-branch tree) (car tree))

(define (right-branch tree) (cadr tree))

(define (symbols tree)
	(if (leaf? tree)
		(list (symbol-leaf tree))
		(caddr tree)))

(define (weight tree)
	(if (leaf? tree)
		(weight-leaf tree)
		(caddr tree)))

(define (decode bits tree)
	(define (decode-1 bits current-branch)
		(if (null? bits)
			'()
			(let ((next-branch (choose-branch (car bits) current-branch)))
				(if (leaf? next-branch)
					(cons (symbol-leaf next-branch)
						(decode-1 (cdr bits) tree))
					(decode-1 (cdr bits) next-branch)))))
	(decode-1 bits tree))

(define (choose-branch branch)
	(cond ((= bit 0) (left-branch branch))
		  ((= bit 1) (right-branch branch))
		  (else (error "bad bit -- CHOOSE-BRANCH" bit))))



(define (adjoin-set x set)
	(cond ((null? set) (list x))
		  ((< (weight x) (weight (car set))) (cons x set))
		  (else (cons (car set) 
		  	          (adjoin-set x (cdr set))))))


(define (make-leaf-set pairs)
	(if (null? pairs)
		'()
		(let ((pair (car pairs)))
			(adjoin-set (make-leaf (car pair)
								   (cadr pair))
			            (make-leaf-set (cdr pairs))))))

(define sample-tree
	(make-code-tree (make-leaf 'A 4)
		(make-code-tree
			(make-leaf 'B 2)
			(make-code-tree (make-leaf 'D 1)
							(make-leaf 'E 1)))))

(define sample-message '(0 1 1 0 0 1 0 1 0 1 1 1 0))


(define (encode-symbol symbol tree)
	(cond ((leaf? tree)
		'())
	((symbol-in-tree? symbol (left-branch tree))
		(cons 0 (encode-symbol symbol (left-branch tree))))
	((symbol-in-tree? symbol (right-branch tree))
		(cons 1 (encode-symbol symbol (right-branch tree))))
	(else
		(error "This symbol not in tress: " symbol))))

(define (symbol-in-tree? given-symbol tree)
	(not 
		(false?
			(find (lambda (s)
					   (eq? s given-symbol))
				  (symbols tree)))))


