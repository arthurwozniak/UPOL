(defun rotate (list)
  (append (cdr list) (cons (car list) '())))

(defun convex-points (p1 p2 p3)
  (let* ((v1 (minus p1 p2))
         (v2 (minus p3 p2))
         (res (cross-product (vect (x v1) (y v1) 0)
                             (vect (x v2) (y v2) 0))))
    (cond ((> (z res) 0) 1)
          ((< (z res) 0) -1)
          (t 0))))

(defun check-convex-polygon-p (points)
  (if (= (length points) 0) NIL)
  (= (mod (apply #'+ (mapcar #'convex-points points (rotate points) (rotate (rotate points))))
          (length points))
     0))

(defun point-in-poly-p (points point)
  (if (= (length points) 0) NIL)
  (= (mod (apply #'+ (mapcar #'convex-points points (make-list (length points) :initial-element point) (rotate points)))
          (length points))
     0))

(defun poly-window ()
  (opengl-interface
   ((color :initform :red)
    (points :initform NIL))
   (:display
    (lambda (canvas)
      (with-slots (color points) canvas
        (color (color-point color))
        (when (> (length points) 2)
          (polygon 
            (dolist (x points)
              (vertex x))))))
    :mouse-press-primary
    (lambda (canvas point)
      (with-slots (color points) canvas
        (if (< (length points) 4) 
            (if (check-convex-polygon-p (cons point points))
                (progn
                  (setf points (cons point points))
                  (invalidate canvas))
              (capi:display-message "Zadany bod nevytvori konvexni polygon")))))
    :mouse-press-secondary
    (lambda (canvas point)
      (with-slots (color points) canvas
        (when (and (> (length points) 2) (point-in-poly-p points point))
          (if (eql color :red)
              (setf color :blue)
            (setf color :red))
          (invalidate canvas)))))))

