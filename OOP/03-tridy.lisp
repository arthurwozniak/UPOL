; 1 - napsat fci (make-rectangle A B)
; 2 - (make-eq-triangle A)
; 3 - (make-eq-poly N R) r - stred az vrchol
;

(defvar *rectangle*) 
(defvar *triangle*)
(defvar *poly*)

(defclass point ()
  ((x :initform 0)
   (y :initform 0)))

(defclass circle ()
  ((center :initform (make-instance 'point))
   (radius :initform 1)))

(defmethod center ((c circle))
  (slot-value c 'center))

(defmethod radius ((c circle))
  (slot-value c 'radius))

(defmethod set-radius ((c circle) value)
  (when (< value 0)
    (error "Circle radius should be a non-negative number"))
  (setf (slot-value c 'radius) value)
  c)

(defmethod x ((point point))
  (slot-value point 'x))

(defmethod y ((point point))
  (slot-value point 'y))

(defmethod set-x ((point point) value)
  (unless (typep value 'number)
    (error "x coordinate of a point should be a number"))
  (setf (slot-value point 'x) value)
  point)

(defmethod set-y ((point point) value)
  (unless (typep value 'number)
    (error "y coordinate of a point should be a number"))
  (setf (slot-value point 'y) value)
  point)


(defmethod r ((point point)) 
  (let ((x (slot-value point 'x)) 
        (y (slot-value point 'y))) 
    (sqrt (+ (* x x) (* y y)))))

(defmethod phi ((point point)) 
  (let ((x (slot-value point 'x)) 
        (y (slot-value point 'y))) 
    (cond ((> x 0) (atan (/ y x))) 
          ((< x 0) (+ pi (atan (/ y x)))) 
          (t (* (signum y) (/ pi 2))))))

(defmethod set-r-phi ((point point) r phi) 
  (setf (slot-value point 'x) (* r (cos phi)) 
        (slot-value point 'y) (* r (sin phi))) 
  point)

(defmethod set-r ((point point) value) 
  (set-r-phi point value (phi point)))

(defmethod set-phi ((point point) value) 
  (set-r-phi point (r point) value))

(defun make-rectangle (a b)
  (unless (and (typep a 'number)
               (typep b 'number))
    (error "A and B can be only numbers"))
  (let ((p1 (make-instance 'point))
        (p2 (make-instance 'point))
        (p3 (make-instance 'point))
        (p4 (make-instance 'point)))
    (set-x p2 b)
    (set-x p3 b)
    (set-y p3 a)
    (set-y p4 a)
    (list p1 p2 p3 p4)))

(setf *rectangle* (make-rectangle 3 4))

(defun make-eq-triangle (a)
  (unless (typep a 'number)
    (error "A can be only number"))
  (let ((p1 (make-instance 'point))
        (p2 (make-instance 'point))
        (p3 (make-instance 'point)))
    (set-x p2 a)
    (set-r p3 a)
    (set-phi p3 (/ PI 3))
    (list p1 p2 p3)))

(setf *triangle* (make-eq-triangle 3))

(defun make-eq-poly (n r)
  (unless (and (and (typep n 'number)
                    (> n 2))
               (and (typep r 'number)
                    (> r 0))))
  (let ((step (/ (* 2 pi) n)))
    (labels ((iterator (list count tmp-point)
               (if (> n count)
                   (progn
                     (set-r tmp-point r)
                     (set-phi tmp-point (* step count))
                     (iterator (cons tmp-point list) (+ 1 count) (make-instance 'point)))
                 list)))
      (iterator NIL 0 (make-instance 'point)))))

(setf *poly* (make-eq-poly 4 3))

(defun point-distance (p1 p2)
  (sqrt (abs (+ (expt (- (x p1) (x p2)) 2)
                (expt (- (y p1) (y p1)) 2)))))

;http://en.wikipedia.org/wiki/Circumscribed_circle#Circumcenter_coordinates

(defun circumscribed-circle (triangle)
  (let* ((a (car triangle))
         (b (cadr triangle))
         (c (caddr triangle))
         (s (/ (+ (point-distance a b) (point-distance b c) (point-distance c a)) 2))
         (area (sqrt (* s (- s (point-distance a b)) (- s (point-distance b c)) (- s (point-distance c a)))))
         (diameter (/ (* (point-distance a b) (point-distance b c) (point-distance c a)) (* 2 area)))
         (d (* 2 (+ (* (x a) (- (y b) (y c)))
                           (* (x b) (- (y c) (y a)))
                           (* (x c) (- (y a) (y b))))))
         (x (/ (+ (* (+ (expt (x a) 2) (expt (y a) 2))
                     (- (y b) (y c)))
                  (* (+ (expt (x b) 2) (expt (y b) 2))
                     (- (y c) (y a)))
                  (* (+ (expt (x c) 2) (expt (y c) 2))
                     (- (y a) (y b))))
               d))
         (y (/ (+ (* (+ (expt (x a) 2) (expt (y a) 2))
                     (- (x c) (x b)))
                  (* (+ (expt (x b) 2) (expt (y b) 2))
                     (- (x a) (x c)))
                  (* (+ (expt (x c) 2) (expt (y c) 2))
                     (- (x b) (x a))))
               d))
         (circle (make-instance 'circle))
         (circle-center (make-instance 'point)))

    (set-x circle-center x)
    (set-y circle-center y)
    (set-radius circle diameter)
    (set-x (center circle) x)
    (set-y (center circle) y)
    circle
  ))



