;; -*- mode: lisp; encoding: utf-8; -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;
;;;; OOP - kód k přednášce 23. října 2014
;;;; Polymorfismus
;;;;

;;;; Před načtením tohoto souboru je třeba načíst knihovnu micro-graphics


;;;
;;; Třída point
;;;

(defclass point () 
  ((x :initform 0) 
   (y :initform 0)
   (color :initform :black) 
   (thickness :initform 1) 
   (window :initform nil)))

;;
;; Čtení a nastavování základních dat 
;; (sloty, polární souřadnice)
;;

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

(defmethod color ((pt point)) 
  (slot-value pt 'color)) 

(defmethod set-color ((pt point) value) 
  (setf (slot-value pt 'color) value)
  pt) 

(defmethod thickness ((pt point)) 
  (slot-value pt 'thickness)) 

(defmethod set-thickness ((pt point) value) 
  (setf (slot-value pt 'thickness) value)
  pt) 

(defmethod window ((pt point)) 
  (slot-value pt 'window))

(defmethod set-window ((pt point) value) 
  (setf (slot-value pt 'window) value)
  pt)

(defmethod shape-mg-window ((pt point))
  (when (window pt)
    (mg-window (window pt))))

;;
;; Transformace
;;

(defmethod move ((pt point) dx dy)
  (set-x pt (+ (x pt) dx))
  (set-y pt (+ (y pt) dy))
  pt)

(defmethod rotate ((pt point) angle center)
  (let ((cx (x center))
        (cy (y center)))
    (move pt (- cx) (- cy))
    (set-phi pt (+ (phi pt) angle))
    (move pt cx cy)
    pt))

(defmethod scale ((pt point) coeff center)
  (let ((cx (x center))
        (cy (y center)))
    (move pt (- cx) (- cy))
    (set-r pt (* (r pt) coeff))
    (move pt cx cy)
    pt))

;;
;; Kreslení
;;

;; U bodu kreslíme plnou kružnici s poloměrem rovným thickness
(defmethod set-mg-params ((pt point)) 
  (let ((mgw (shape-mg-window pt)))
    (mg:set-param mgw :foreground (color pt)) 
    (mg:set-param mgw :filledp t))
  pt)
(defmethod do-draw ((pt point)) 
  (mg:draw-circle (shape-mg-window pt) 
                  (x pt) 
                  (y pt) 
                  (thickness pt))
  pt)

(defmethod draw ((pt point))
  (set-mg-params pt)
  (do-draw pt))


;;;
;;; Třída circle
;;;

(defclass circle () 
  ((center :initform (make-instance 'point)) 
   (radius :initform 1)
   (color :initform :black)
   (thickness :initform 1)
   (filledp :initform nil)
   (window :initform nil)))

(defmethod radius ((c circle))
  (slot-value c 'radius))

(defmethod set-radius ((c circle) value)
  (when (< value 0)
    (error "Circle radius should be a non-negative number"))
  (setf (slot-value c 'radius) value)
  c)

(defmethod center ((c circle))
  (slot-value c 'center))

(defmethod color ((c circle))
  (slot-value c 'color))

(defmethod set-color ((c circle) value)
  (setf (slot-value c 'color) value)
  c)

(defmethod thickness ((c circle))
  (slot-value c 'thickness))

(defmethod set-thickness ((c circle) value)
  (setf (slot-value c 'thickness) value)
  c)

(defmethod filledp ((c circle))
  (slot-value c 'filledp))

(defmethod set-filledp ((c circle) value)
  (setf (slot-value c 'filledp) value)
  c)

(defmethod window ((c circle))
  (slot-value c 'window))

(defmethod set-window ((c circle) value)
  (setf (slot-value c 'window) value)
  c)

(defmethod shape-mg-window ((c circle))
  (when (window c)
    (mg-window (window c))))

;;
;; Transformace
;;

(defmethod move ((c circle) dx dy)
  (move (center c) dx dy)
  c)

(defmethod rotate ((c circle) angle center)
  (rotate (center c) angle center)
  c)

(defmethod scale ((c circle) coeff center)
  (scale (center c) coeff center)
  (set-radius c (* (radius c) coeff))
  c)

;;
;; Kreslení
;;

(defmethod set-mg-params ((c circle))
  (let ((mgw (shape-mg-window c)))
    (mg:set-param mgw :foreground (color c))
    (mg:set-param mgw :thickness (thickness c))
    (mg:set-param mgw :filledp (filledp c)))
  c)

(defmethod do-draw ((c circle))
  (mg:draw-circle (shape-mg-window c)
                  (x (center c))
                  (y (center c))
                  (radius c))
  c)

(defmethod draw ((c circle))
  (set-mg-params c)
  (do-draw c))

;;;
;;; Třída picture
;;;

(defclass picture ()
  ((items :initform '())
   (window :initform nil)))

;;
;; Sloty
;;

(defmethod window ((shape picture))
  (slot-value shape 'window))
 
(defmethod set-window ((shape picture) value)
  (dolist (item (items shape))
    (set-window item value))
  (setf (slot-value shape 'window) value)
  shape)

(defmethod shape-mg-window ((shape picture))
  (when (window shape)
    (mg-window (window shape))))

(defmethod items ((pic picture)) 
  (copy-list (slot-value pic 'items)))

(defmethod set-items ((pic picture) value) 
  (unless (every (lambda (elem) 
                   (or (typep elem 'point) 
                       (typep elem 'circle) 
                       (typep elem 'picture)
		       (typep elem 'polygon)))
                 value)
    (error "Picture elements are not of desired type."))
  (setf (slot-value pic 'items) (copy-list value))
  pic)

;;
;; Transformace
;;

(defmethod move ((pic picture) dx dy)
  (dolist (it (items pic))
    (move it dx dy))
  pic)

(defmethod rotate ((pic picture) angle center)
  (dolist (it (items pic))
    (rotate it angle center))
  pic)

(defmethod scale ((pic picture) coeff center)
  (dolist (item (items pic))
    (scale item coeff center))
  pic)

;;
;; Kreslení
;;

(defmethod draw ((pic picture))
  (dolist (item (reverse (items pic)))
    (draw item))
  pic)

;;;
;;; Třída polygon
;;;

(defclass polygon ()
  ((items :initform '())
   (color :initform :black)
   (thickness :initform 1)
   (filledp :initform nil)
   (closedp :initform t)
   (window :initform nil)))

;;
;; Sloty
;;

(defmethod items ((poly polygon)) 
  (copy-list (slot-value poly 'items)))

(defmethod set-items ((poly polygon) value) 
  (unless (every (lambda (elem) 
                   (typep elem 'point)) 
                 value)
    (error "Invalid polygon element type."))
  (setf (slot-value poly 'items) (copy-list value))
  poly)

(defmethod color ((p polygon))
  (slot-value p 'color))

(defmethod set-color ((p polygon) value)
  (setf (slot-value p 'color) value)
  p)

(defmethod thickness ((p polygon))
  (slot-value p 'thickness))

(defmethod set-thickness ((p polygon) value)
  (setf (slot-value p 'thickness) value)
  p)

(defmethod closedp ((p polygon))
  (slot-value p 'closedp))

(defmethod set-closedp ((p polygon) value)
  (setf (slot-value p 'closedp) value)
  p)

(defmethod filledp ((p polygon))
  (slot-value p 'filledp))

(defmethod set-filledp ((p polygon) value)
  (setf (slot-value p 'filledp) value)
  p)

(defmethod window ((p polygon))
  (slot-value p 'window))

(defmethod set-window ((p polygon) value)
  (setf (slot-value p 'window) value)
  p)

(defmethod shape-mg-window ((shape polygon))
  (when (window shape)
    (mg-window (window shape))))

;;
;; Transformace
;;

(defmethod move ((poly polygon) dx dy)
  (dolist (it (items poly))
    (move it dx dy))
  poly)

(defmethod rotate ((poly polygon) angle center)
  (dolist (it (items poly))
    (rotate it angle center))
  poly)

(defmethod scale ((poly polygon) coeff center)
  (dolist (item (items poly))
    (scale item coeff center))
  poly)


;; 
;; Kreslení
;;

(defmethod set-mg-params ((poly polygon)) 
  (let ((mgw (shape-mg-window poly)))
    (mg:set-param mgw :foreground (color poly)) 
    (mg:set-param mgw :thickness (thickness poly)) 
    (mg:set-param mgw :filledp (filledp poly))
    (mg:set-param mgw :closedp (closedp poly)))
  poly)

(defmethod do-draw ((poly polygon)) 
  (let (coordinates)
    (dolist (point (reverse (items poly)))
      (setf coordinates (cons (y point) coordinates))
      (setf coordinates (cons (x point) coordinates)))
    (mg:draw-polygon (shape-mg-window poly) 
                     coordinates))
  poly)

(defmethod draw ((poly polygon)) 
  (set-mg-params poly) 
  (do-draw poly))

;;;
;;; Třída window
;;;

(defclass window ()
  ((mg-window :initform (mg:display-window))
   (shape :initform nil)
   (background :initform :white)))

(defmethod mg-window ((window window))
  (slot-value window 'mg-window))

(defmethod shape ((w window))
  (slot-value w 'shape))

(defmethod set-shape ((w window) shape)
  (set-window shape w)
  (setf (slot-value w 'shape) shape)
  w)

(defmethod background ((w window))
  (slot-value w 'background))

(defmethod set-background ((w window) color)
  (setf (slot-value w 'background) color)
  w)

(defmethod redraw ((window window))
  (let ((mgw (slot-value window 'mg-window)))
    (mg:set-param mgw :background (background window))
    (mg:clear mgw)
    (when (shape window)
      (draw (shape window))))
  window)

; deadline - neděle
; napsat funkci make-eu-flag - nakreslení vlajky eu

(defvar *unit*)
(setf *unit* 500)

(defmethod make-star (n r1 r2)
  (unless (and (typep n 'number)
               (and (typep r1 'number)
                    (> r1 0))
               (and (typep r2 'number)
                    (> r2 0))))
  (let ((step (/ (* 2 pi) n))
        (poly (make-instance 'polygon)))
    (labels ((iterator (list count tmp-point)
               (if (> n count)
                   (progn
                     (if (= (mod count 2) 0)
                         (set-r tmp-point r2)
                       (set-r tmp-point r1))
                     (set-phi tmp-point (* step count))
                     (iterator (cons tmp-point list) (+ 1 count) (make-instance 'point)))
                 list)))
      (set-items poly (iterator NIL 0 (make-instance 'point)))
      (rotate poly (/ pi 11) (make-instance 'point))
      poly)))

(defmethod make-square (ref side-a side-b)
  (let ((p1 (make-instance 'point))
        (p2 (make-instance 'point))
        (p3 (make-instance 'point))
        (p4 (make-instance 'point))
        (my-poly (make-instance 'polygon)))
    (set-x p1 0)
    (set-y p1 0)
    (set-x p2 (* side-a ref))
    (set-y p2 0)
    (set-x p3 (* side-a ref))
    (set-y p3 (* side-b ref))
    (set-x p4 0)
    (set-y p4 (* side-b ref))
    (set-items my-poly (list p1 p2 p3 p4))
    my-poly))

(defmethod make-background ()
  (let ((p1 (make-instance 'point))
        (p2 (make-instance 'point))
        (p3 (make-instance 'point))
        (p4 (make-instance 'point))
        (my-poly (make-instance 'polygon)))
    (set-x p1 0)
    (set-y p1 0)
    (set-x p2 (* 3 *unit*))
    (set-y p2 0)
    (set-x p3 (* 3 *unit*))
    (set-y p3 (* 2 *unit*))
    (set-x p4 0)
    (set-y p4 (* 2 *unit*))
    (set-items my-poly (list p1 p2 p3 p4))
    my-poly))

(defmethod make-eu-flag ()
  (let* ((distance (* (/ 2 3) *unit*))
         (n 12)
         (center-point (make-instance 'point))
         (my-picture (make-instance 'picture))
         (step (/ (* 2 pi) n))
         (count 12)
         (background (make-square *unit* 3 2)))
    (labels ((iterator (list count)
               (if (> n count)
                   (let ((star (make-star 10 (/ (* *unit* (/ 2 9)) 2) (/ (* *unit* (/ 2 9)) 4))))
                     (rotate star (- (* count step)) center-point)
                     (move star distance 0)
                     (rotate star (* count step) center-point)
                     (set-color star :YELLOW)
                     (set-filledp star T)
                     (iterator (cons star list) (+ 1 count)))
                 list)))
      (set-items my-picture (iterator NIL 0))
      (move my-picture (* *unit* (/ 3 2)) *unit*)
      (set-filledp background T)
      (set-color background :BLUE)
      (set-items my-picture (reverse (cons background (items my-picture))))
      my-picture)))

(defmethod make-usa-flag ()
  (let* ((side-a 1.9)
         (side-b 1)
         (star-r 0.0616)
         (sq-side-a 0.76)
         (sq-side-b (/ 7 13))
         (strip-width (/ 1 13))
         (star-horizontal 0.063)
         (star-vertical 0.054)
         (strip-count 13)
         (star-lines 9)
         (my-picture (make-instance 'picture)))
    ; generování pruhů
    (labels ((iterator (n)
               (if (> strip-count n)
                   (let ((tmp-strip (make-square *unit* side-a strip-width)))
                     (move tmp-strip 0 (* n strip-width *unit*))
                     (set-color tmp-strip (if (= (mod n 2) 0)
                                              :RED
                                            :WHITE))
                     (set-filledp tmp-strip T)
                     (set-items my-picture (cons tmp-strip (items my-picture)))
                     (iterator (+ 1 n))))))
      (iterator 0))
    ; rámeček na hvězdy
    (let ((blue-rectangle (make-square *unit* sq-side-a sq-side-b)))
      (set-color blue-rectangle :BLUE)
      (set-filledp blue-rectangle T)
      (set-items my-picture (cons blue-rectangle (items my-picture))))
    ; vykreslení hvězd ( 9 řad)
    (labels ((iterator (n)
               (if (>= star-lines n)
                   (progn 
                     (labels ((second-iterator (i count)
                                (if (>= count i)
                                    (let ((my-star (make-star 10 (* (/ star-r 2) *unit*) (* (/ star-r 4) *unit*))))
                                      (set-color my-star :white)
                                      (set-filledp my-star T)
                                      (move my-star (+ (if (= (mod n 2) 0) (* *unit* star-horizontal) 0)
                                                       (* (- (* 2 i) 1) star-horizontal *unit*))
                                            (* n star-vertical *unit*))
                                      (set-items my-picture (cons my-star (items my-picture)))
                                      (second-iterator (+ 1 i) count)))))
                       (second-iterator 1 (if (= (mod n 2) 1) 6 5)))
                     (iterator (+ 1 n))))))
      (iterator 1))
    my-picture))


    


(setf flag (make-usa-flag))
(setf win (make-instance 'window))
(set-window flag win)
(set-shape win flag)
(redraw win)
