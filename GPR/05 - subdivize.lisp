(defun rotate-list (list)
  (append (cdr list) (cons (car list) '())))

(defun jehlan ()
  (dotimes (x 4)
    (let ((p1 (plus-origin (rotate (vect 0 0 1) (* (/ pi 2) x) (vect 0 1 0))))
          (p2 (plus-origin (rotate (vect 0 1 0) (* (/ pi 2) x) (vect 0 1 0))))
          (p3 (plus-origin (rotate (vect 1 0 0) (* (/ pi 2) x) (vect 0 1 0)))))
      (polygon
        (dolist (it (list p1 p2 p3))
            (color (abs-point it))
            (vertex it))))))

(defun extract-points (l)
      (when (= 3 (length l))
        (polygon
          (color (abs-point (car l)))
          (dolist (x l)
            ;(color (abs-point x))
            (vertex x))))
      (unless (= 3 (length l))
        (mapcar #'extract-points l)))

(defun jehlan-sub ()
  (dotimes (x 4)
    (let ((p1 (plus-origin (rotate (vect 0 0 1) (* (/ pi 2) x) (vect 0 1 0))))
          (p2 (plus-origin (rotate (vect 0 1 0) (* (/ pi 2) x) (vect 0 1 0))))
          (p3 (plus-origin (rotate (vect 1 0 0) (* (/ pi 2) x) (vect 0 1 0)))))
        (extract-points (subdivision p1 p2 p3 10)))))

(defun vytvor-osmihran ()
  (with-c-s-pushed
    (c-s-scale 200)
    (jehlan-sub)
    (c-s-scale 1 -1 1)
    (jehlan-sub)))

(defun abs-point(p)
  (point (abs (x p))
         (abs (y p))
         (abs (z p))))

(defun subdivision (p1 p2 p3 level)
  (if (= level 0)
      (list p1 p2 p3)
    (progn
      (let ((p12 (plus-origin (normalize (minus-origin (plus p2 (mult 1/2 (minus p1 p2)))))))
            (p23 (plus-origin (normalize (minus-origin (plus p3 (mult 1/2 (minus p2 p3)))))))
            (p13 (plus-origin (normalize (minus-origin (plus p3 (mult 1/2 (minus p1 p3))))))))

        (mapcar  #'(lambda (x) 
                     (apply #'subdivision x)) (list (list p1 p12 p13 (- level 1))
                                                    (list p2 p12 p23 (- level 1))
                                                    (list p3 p13 p23 (- level 1))
                                                    (list p12 p13 p23 (- level 1))))))))

(opengl-canvas (3d)
               ()
               (display ()
                        (vytvor-osmihran)))


; subdivize - vstup 3 body a uroven rozdelovani. Nula nic, 1 rozrezat v pulce, 2... rekurze