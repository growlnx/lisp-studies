(setf program "Program")
(setf version "1.0")

(defun get-version ()
	(format t "~A - version: ~A~%" program version)
)

; mensagem de ajuda
(defun help	()
	(get-version)
	(format t "Usage: ~A [OPTIONS]~2%OPTIONS:~%" (file-namestring *LOAD-PATHNAME*) )
	(format t "~5T--h, -help                Help message     [OPTIONAL]~%")
	(format t "~5T--v, -version             Program version  [OPTIONAL]~%")
	(format t "~5T--i FILE, -input  FILE    Input file       [REQUIRED]~%")
	(format t "~5T--o FILE, -output FILE    Output file      [REQUIRED]~%")
	(format t "~%For More Help, See The Documentation: http://link.to/docs~%")
	(quit)
)

; parsing ...
(if (not *args*)
	(help)
)

(setf arguments *args* )
(setf *options* (make-hash-table))

(loop while (not (eq arguments NIL)) do	
    (let ((first-arg (car arguments)))
    	(cond 

    		((or (string= first-arg '"--h") (string= first-arg '"-help"))
    			(help)
    		)

    		((or (string= first-arg '"--v") (string= first-arg '"-version"))
    			(quit(get-version))
    		)
    		
    		((or (string= first-arg '"--i") (string= first-arg '"-input"))
    			(progn
		    		(setf arguments (cdr arguments)) ; remove --i
		    		(setf (gethash 'input *options*) (car arguments)) ; store input
		    		(setf arguments (cdr arguments)) ; remove input
		    	)
		    )

		    ((or (string= first-arg '"--o") (string= first-arg '"-output"))
		    	(progn
		    		(setf arguments (cdr arguments)) ; remove --o
		    		(setf (gethash 'output *options*) (car arguments)) ; store input
		    		(setf arguments (cdr arguments)) ; remove output
		    	)
		    )

		    (t
		    	(progn
			   		(format t "Error: Invalid Option `~A`~2%" first-arg )
			   		(help)
				)
    		)
    	)
	)
)

(makunbound 'arguments)

(let ((missing-arg NIL ))
	
	(if (eql (gethash 'input *options*) NIL)
		(progn
			(format t "Error: [--i FILE, -input FILE]   Input Parameter are Required!~2%")
			(setq missing-arg t)
		)
	)

	(if (eql (gethash 'output *options*) NIL)
		(progn
			(format t "Error: [--o FILE, -output FILE]  Output Parameter are Required!~2%")
			(setq missing-arg t)
		)
	)

	(if missing-arg (help))
)

;------------------------------------------------------------------------------
; Do More Validations on *Options* Hash-Table...
;------------------------------------------------------------------------------
