(defun rotate-list (list)
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
  (= (abs (apply #'+ (mapcar #'convex-points points (rotate-list points) (rotate-list (rotate-list points)))))
          (length points)))

(defun point-in-poly-p (points point)
  (if (= (length points) 0) NIL)
  (= (abs (apply #'+ (mapcar #'convex-points points (make-list (length points) :initial-element point) (rotate-list points))))
          (length points)))


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
          (progn
            (setf points (cons point points))
            (invalidate canvas))
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
        (invalidate canvas))))))


(defun square()
  (let ((points (list (point 0 0)
                      (point 0 1)
                      (point 1 1)
                      (point 1 0))))
    (polygon 
      (dolist (x points)
        (vertex x)))))

(opengl-interface
 ((color :initform :red)
  (default-offset :initform 100)
  (arm-angle :initform (- (/ pi 4)))
  (offset_x :initform 0)
  (offset_y :initform 0)
  (angle :initform (/ pi 4)))
 (:display
  (lambda (canvas)
    (with-slots (color offset_x offset_y angle default-offset arm-angle) canvas
      (color (color-point color))
      (c-s-translate (vect (+ default-offset offset_x) (+ default-offset offset_y)))
      (with-c-s-pushed
       (c-s-rotate arm-angle)
       (c-s-scale 100 30)
       (square)
       (c-s-translate (vect 1 0))
       (c-s-rotate (+ arm-angle (* 2 angle)))
       (square)
       (c-s-translate (vect 1 0))
       (c-s-scale (/ 30 100) 1)
       (c-s-rotate (/ pi 12))
       (square)
       (c-s-translate (vect 1 0))
       (c-s-scale (/ 1 2) (/ 1 7))
        
       (dotimes (x 4)
         (with-c-s-pushed
           (c-s-translate (vect 0 (* 2 x)))
           (if (= x 2)
               (with-c-s-pushed
                 (c-s-scale 2 1)
                 (square))
             (square))))
       (c-s-translate (vect -1 6))
       (c-s-rotate (+ (/ pi 4)))
       (square)
)))
  :key-press
  (lambda (canvas key)
    (with-slots (offset_x offset_y angle) canvas
      (cond ((eql key #\a)
             (setf offset_x (- offset_x 1)))
            ((eql key #\d)
             (setf offset_x (+ offset_x 1)))
            ((eql key #\w)
             (setf offset_y (+ offset_y 1)))
            ((eql key #\s)
             (setf offset_y (- offset_y 1)))
            ((eql key #\q)
             (setf angle (+ angle (/ 1 (* 12 pi)))))
            ((eql key #\e)
             (setf angle (- angle (/ 1 (* 12 pi))))))
      (invalidate canvas)))))
