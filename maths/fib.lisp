;------------------------------------------------------------------------------
; Fibonacci in Dinamic Programming Implementation
;------------------------------------------------------------------------------

(defconstant LIM 1001)

(setf memo (make-array LIM :adjustable t))

; initializing...
(dotimes (n LIM)
	(setf (aref memo n) -1)
)

; base cases
(setf (aref memo 0) 0)
(setf (aref memo 1) 1)
(setf (aref memo 2) 1)

; fibonacci's function 
(defun fibonacci (n)
	(if (= (aref memo n) -1) 
		(setf (aref memo n) 
			(+ (fibonacci (- n 1)) (fibonacci (- n 2)))
		)
	)
	(aref memo n)
)

; now we have a dinamic Fibonacci in range 0~1000
(print (fibonacci 1000)) ; O(n)
(print (fibonacci 10))   ; O(1)
(print (fibonacci 996))  ; O(1)
(print (fibonacci 100))  ; O(1)
(print (fibonacci 125))  ; O(1)
(print (fibonacci 09))   ; O(1)
(print (fibonacci 916))  ; O(1)
(print (fibonacci 11))   ; O(1)
(print (fibonacci 05))   ; O(1)