;(define wave2 (beside wave (flip-vert wave)))

(define (flipped-pairs painter)
	(let ((painter2 (beside painter (flip-vert painter))))
	(below painter2 painter2)))

(define wave4 (flipped-pairs wave))

