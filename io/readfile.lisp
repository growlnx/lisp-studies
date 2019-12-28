(setf filepath (namestring *load-truename*))

(format t "Contents of file: ~A~%" filepath )

(let ((in (open filepath :if-does-not-exist nil)))
	(when in
		(loop for line = (read-line in nil)
    		while line do (format t "~A~%" line))
    	(close in)
    )
)