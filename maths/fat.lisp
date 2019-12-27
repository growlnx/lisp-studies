;------------------------------------------------------------------------------
; Factorial in Dinamic Programming Implementation
;------------------------------------------------------------------------------

(defconstant LIM 101)

(setf memo (make-array LIM :adjustable t))

; initializing...
(dotimes (n LIM)
	(setf (aref memo n) -1)
)

; base case
(setf (aref memo 0) 1)

; factorial function 
(defun fat (n)
	(if (= (aref memo n) -1) 
		(setf (aref memo n) 
			(* n (fat (- n 1))) 
		)
	)
	(aref memo n)
)

; now we have a dinamic Fibonacci in range 0~1000
(print (fat 100)) ; O(n)
(print (fat 11))  ; O(1)
(print (fat 96))  ; O(1)
(print (fat 10))  ; O(1)
(print (fat 25))  ; O(1)
(print (fat 9))   ; O(1)
(print (fat 91))  ; O(1)
(print (fat 12))  ; O(1)
(print (fat 05))  ; O(1)