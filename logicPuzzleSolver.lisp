(defun main ()
  (setf OneA nil)
  (setf OneB nil)
  (setf OneC nil)
  (let ((in (open #P"~/Desktop/AI projects/LogicPuzzleSolver/puzzleOne.txt" :if-does-not-exist nil)))
    (loop
     (setq temp (read in))
     (when (equalp temp nil) (return))
     (setf OneA (append OneA (cons temp nil))))
    
    (loop
     (setq temp (read in))
     (when (equalp temp nil) (return))
     (setf OneB (append OneB (cons temp nil))))

    (loop
     (setq temp (read in))
     (when (equalp temp nil) (return))
     (setf OneC (append OneC (cons temp nil))))

    (dotimes (a (list-length OneA))
      (setq temp (nth a OneA))
      (dotimes (b (list-length OneB))
        (setf (get temp (nth b OneB)) (nth b OneB))
        (setf (get temp (nth b OneC)) (nth b OneC))))
    
  (close in)))

(defun notPair(x y)
  (remprop x y))

(defun andPair(x y)
  (dolist (a (symbol-plist x))
    (if (not (equalp a y)) (remprop x a)))) 

