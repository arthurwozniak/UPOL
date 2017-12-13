;; -*- mode: lisp; encoding: utf-8; -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;
;;;; OOP - kód k přednášce 30. října 2014
;;;; Dědičnost 1 (s přepisováním metod, ale bez volání zděděné metody)
;;;;

;;;; Před načtením tohoto souboru je třeba načíst knihovnu micro-graphics


;;;
;;; Třída shape
;;;

(defclass shape ()
  ((color :initform :black)
   (thickness :initform 1)
   (filledp :initform nil)
   (window :initform nil)))

(defmethod window ((shape shape)) 
  (slot-value shape 'window))

(defmethod set-window ((shape shape) value) 
  (setf (slot-value shape 'window) value)
  shape)

(defmethod shape-mg-window ((shape shape))
  (when (window shape)
    (mg-window (window shape))))

(defmethod color ((shape shape)) 
  (slot-value shape 'color))

(defmethod set-color ((shape shape) value) 
  (setf (slot-value shape 'color) value)
  shape)

(defmethod thickness ((shape shape)) 
  (slot-value shape 'thickness)) 

(defmethod set-thickness ((shape shape) value) 
  (setf (slot-value shape 'thickness) value)
  shape) 

(defmethod filledp ((shape shape))
  (slot-value shape 'filledp))

(defmethod set-filledp ((shape shape) value)
  (setf (slot-value shape 'filledp) value)
  shape)

(defmethod move ((shape shape) dx dy)
  shape)

(defmethod rotate ((shape shape) angle center)
  shape)

(defmethod scale ((shape shape) coeff center)
  shape)

(defmethod set-mg-params ((shape shape)) 
  (let ((mgw (shape-mg-window shape)))
    (mg:set-param mgw :foreground (color shape)) 
    (mg:set-param mgw :filledp (filledp shape))
    (mg:set-param mgw :thickness (thickness shape)))
  shape)

(defmethod do-draw ((shape shape)) 
  shape)

(defmethod draw ((shape shape))
  (set-mg-params shape)
  (do-draw shape))


;;;
;;; Třída point
;;;

(defclass point (shape) 
  ((x :initform 0) 
   (y :initform 0)))

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

(defmethod set-mg-params ((pt point))
  (let ((mgw (shape-mg-window pt)))
    (mg:set-param mgw :foreground (color pt)) 
    (mg:set-param mgw :filledp (filledp pt))
    (mg:set-param mgw :thickness (thickness pt))
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


;;;
;;; Třída circle
;;;

(defclass circle (shape) 
  ((center :initform (make-instance 'point)) 
   (radius :initform 1)))

(defmethod radius ((c circle))
  (slot-value c 'radius))

(defmethod set-radius ((c circle) value)
  (when (< value 0)
    (error "Circle radius should be a non-negative number"))
  (setf (slot-value c 'radius) value)
  c)

(defmethod center ((c circle))
  (slot-value c 'center))

(defmethod do-draw ((c circle))
  (mg:draw-circle (shape-mg-window c)
                  (x (center c))
                  (y (center c))
                  (radius c))
  c)

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


;;;
;;; Třída compound-shape
;;;

(defclass compound-shape (shape)
  ((items :initform '())))

(defmethod items ((shape compound-shape)) 
  (copy-list (slot-value shape 'items)))

(defmethod send-to-items ((shape compound-shape) 
			  message
			  &rest arguments)
  (dolist (item (items shape))
    (apply message item arguments))
  shape)

(defmethod check-item ((shape compound-shape) item)
  (error "Method check-item has to be rewritten"))

(defmethod check-items ((shape compound-shape) item-list)
  (dolist (item item-list)
    (check-item shape item))
  shape)

(defmethod set-items ((shape compound-shape) value)
  (check-items shape value)
  (setf (slot-value shape 'items) (copy-list value))
  (send-to-items shape #'set-window (window shape))
  shape)

(defmethod move ((shape compound-shape) dx dy)
  (send-to-items shape #'move dx dy)
  shape)

(defmethod rotate ((shape compound-shape) angle center)
  (send-to-items shape #'rotate angle center)
  shape)

(defmethod scale ((shape compound-shape) coeff center)
  (send-to-items shape #'scale coeff center)
  shape)


;;;
;;; Třída picture
;;;

(defclass picture (compound-shape)
  ((propagate-color-p :initform nil)))

(defmethod propagate-color-p ((p picture))
  (slot-value p 'propagate-color-p))

(defmethod send-to-items-set-color ((p picture) color)
  (send-to-items p #'set-color color)
  p)

(defmethod set-propagate-color-p ((p picture) value)
  (setf (slot-value p 'propagate-color-p) value)
  (when value
    (send-to-items-set-color p (color p)))
  p)

(defmethod set-color ((p picture) color)
  (setf (slot-value p 'color) color)
  (when (propagate-color-p p)
    (send-to-items-set-color p (color p)))
  p)

(defmethod set-items ((p picture) items)
  (check-items p items)
  (setf (slot-value p 'items) (copy-list items))
  (send-to-items p #'set-window (window p))
  (when (propagate-color-p p)
    (send-to-items-set-color p (color p)))
  p)

(defmethod check-item ((pic picture) item)
  (unless (typep item 'shape)
    (error "Invalid picture element type."))
  pic)

(defmethod set-window ((pic picture) value) 
  (send-to-items pic #'set-window value)
  (setf (slot-value pic 'window) value)
  pic)

(defmethod draw ((pic picture))
  (dolist (item (reverse (items pic)))
    (draw item))
  pic)


;;;
;;; Třída polygon
;;;

(defclass polygon (compound-shape)
  ((closedp :initform t)))

(defmethod check-item ((p polygon) item)
  (unless (typep item 'point)
    (error "Invalid polygon element type."))
  p)

(defmethod closedp ((p polygon))
  (slot-value p 'closedp))

(defmethod set-closedp ((p polygon) value)
  (setf (slot-value p 'closedp) value)
  p)

(defmethod set-mg-params ((poly polygon)) 
  (let ((mgw (shape-mg-window poly)))
    (mg:set-param mgw :foreground (color poly)) 
    (mg:set-param mgw :filledp (filledp poly))
    (mg:set-param mgw :thickness (thickness poly))
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


;;;
;;; empty-shape
;;;

(defclass empty-shape (shape)
  ())


;;;
;;; full-shape
;;;

(defclass full-shape (shape)
  ())

(defmethod set-mg-params ((shape full-shape)) 
  (mg:set-param (shape-mg-window shape) 
		:background
		(color shape))
  shape)

(defmethod do-draw ((shape full-shape))
  (mg:clear (shape-mg-window shape))
  shape)


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

(defmethod make-rectangle (ref side-a side-b)
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

; *scale* určuje měřítko

(defvar *scale*)
(setf *scale* 100)

(defclass changable-picture (picture)
  ((visible-list :initform NIL)))

(defmethod visible-list ((c-picture changable-picture))
  (copy-list (slot-value c-picture 'visible-list)))

(defmethod set-visible-list ((c-picture changable-picture) list)
  (unless (typep list 'CONS)
    (error "Invalid parameter argument"))
  (setf (slot-value c-picture 'visible-list) (copy-list list)))

(defmethod set-items ((c-picture changable-picture) items)
  (check-items c-picture items)
  (setf (slot-value c-picture 'items) (copy-list items))
  (set-visible-list c-picture (make-list (length items) :initial-element T))
  (send-to-items c-picture #'set-window (window c-picture))
  (when (propagate-color-p c-picture)
    (send-to-items-set-color c-picture (color c-picture)))
  c-picture)

(defmethod draw ((c-picture changable-picture))
  (let* ((reversed (reverse (items c-picture)))
         (list-len (length reversed))
         (visibles (visible-list c-picture)))
    (labels ((iterator (count)
               (if (<= count list-len)
                   (if (nth count visibles)
                       (progn
                         (draw (nth count reversed))
                         (iterator (+ count 1)))
                     (iterator (+ count 1))))))
      (iterator 0))))
                     
(defclass field (changable-picture) ())

(defmethod make-circle ()
  (let ((circ (make-instance 'circle)))
    (set-x (center circ) (/ *scale* 6))
    (set-y (center circ) (/ *scale* 6))
    (set-radius circ (* *scale* (/ 3 24)))
    circ))

(defmethod make-cross ()
  (let ((my-pic (make-instance 'picture))
        (poly (make-instance 'polygon))
        (poly2 (make-instance 'polygon))
        (c-point (make-instance 'point)))
    (set-x c-point (/ *scale* 6))
    (set-y c-point (/ *scale* 6))
    (set-items poly 
               (let ((p1 (make-instance 'point))
                     (p2 (make-instance 'point)))
                 (set-x p1 (* *scale* (/ 1 12)))
                 (set-y p1 (* *scale* (/ 1 12)))
                 (set-x p2 (* *scale* (/ 3 12)))
                 (set-y p2 (* *scale* (/ 3 12)))
                 (list p1 p2)))
    (set-items poly2
               (let ((p1 (make-instance 'point))
                     (p2 (make-instance 'point)))
                 (set-x p2 (* *scale* (/ 1 12)))
                 (set-y p1 (* *scale* (/ 1 12)))
                 (set-x p1 (* *scale* (/ 3 12)))
                 (set-y p2 (* *scale* (/ 3 12)))
                 (list p1 p2)))
    (set-items my-pic (list poly poly2))))
;   (set-items my-pic (list poly))
;   (set-items my-pic (cons (rotate poly (/ pi 4) c-point) (items my-pic)))))

(defmethod make-field ((sq field))
  (set-items sq (list (make-cross) (make-circle) (make-rectangle *scale* (/ 1 3) (/ 1 3))))
  (set-state sq NIL))

(defmethod set-state ((sq field) state)
  (cond ((eql state :CIRC)
         (set-visible-list sq '(T T NIL)))
        ((eql state :CROSS)
         (set-visible-list sq '(T NIL T)))
        (t (set-visible-list sq '(T NIL NIL)))))

(setf win (make-instance 'window))

(setf circ (make-instance 'field))
(make-field circ)
(set-shape win circ)
;(move circ -40 -40)
;(rotate circ (+ (/ PI 15)) (make-instance 'point))
(set-state circ :CROSS)
(redraw win)