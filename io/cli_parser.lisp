(setf program "Program")
(setf version "1.0")

; mensagem de ajuda
(defun help	()
	(format t "~A - version: ~A~%" program version)
	(format t "Usage: ~A [OPTIONS]~2%OPTIONS:~%" (file-namestring *LOAD-PATHNAME*) )
	(format t "~5T--h,-help      Show this help mensage~%")
	(format t "~5T--i,-input     Input file [REQUIRED]~%")
	(format t "~5T--o,-output    Output file [REQUIRED]~%")
)

; parsing ...
(if (not *args*)
	(quit (help))
)

(setf arguments *args* )
(setf *options* (make-hash-table))

(loop while (not (eq arguments NIL)) do	
	(setf arg (car arguments))
	(print "OOOHOHOHHO")
	(if (or (string= arg '"--h") (string= arg '"-help"))
		(quit (help))
    	; elsif
	    (if (or (string= arg '"--i") (string= arg '"-input"))
	    	(progn
	    		(setf arguments (cdr arguments)) ; remove --i
	    		(if (not findfile (car arguments))
					(quit(format "File ~A does not exists in your system!~%"))
				)
	    		(setf (gethash 'input *options*) (car arguments)) ; store input
	    		(setf arguments (cdr arguments)) ; remove input
	    		; (write (gethash 'input *options*))
	    	)
	    	; elsif
		    (if (or (string= arg '"--o") (string= arg '"-output"))
		    	(progn
		    		(setf arguments (cdr arguments)) ; remove --o
		    		(setf (gethash 'output *options*) (car arguments)) ; store input
		    		(setf arguments (cdr arguments)) ; remove output
		    		; (write (gethash 'output *options*))
		    	)

		    	; else
		    	(progn
			   		(format t "~%invalid option ~A~%" arg )
			    	(quit)
			    )
    		)
		)
	)
)

(makunbound 'arguments)

(if (eql (gethash 'input *options*) NIL)
	(format t "[--i, -input]  Input are required!~%")
)

(if (eql (gethash 'output *options*) NIL)
	(format t "[--o, -output] Output are required!~%")
)