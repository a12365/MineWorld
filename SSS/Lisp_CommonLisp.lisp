(defun px2 (a b c)
(setq d (- (expt b 2.0) (* 4 a c)))
(cond ((< d 0) (prompt "\nNo root!"))
     ((= d 0) (progn (setq x (/ b (* -2.0 a))) (prompt "\nOne root!   x=") (princ x)))
     ((> d 0) (progn (setq x1 (/ (- (sqrt d) b) (* 2.0 a)) x2 (/ (+ (sqrt d) b) (* -2.0 a)))
      (prompt "\nTwo root!  x1=") (princ x1) (prompt "        x2=") (princ x2))));cond
(princ));end
