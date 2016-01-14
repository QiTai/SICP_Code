(define (install-rectangular-package)
	;;internal procedures
	(define (real-part z) (car z))
	(define (imag-part z) (cdr z))
	;;interface to the rest of the system
	(put 'real-part '(rectangular) real-part)
	(put 'imag-part '(rectangular) imag-part)

	'done)
