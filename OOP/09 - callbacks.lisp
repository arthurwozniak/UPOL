;; -*- mode: lisp; encoding: utf-8; -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;
;;;; OOP - kód k přednášce 20. listopadu 2014
;;;; Zpětná volání
;;;;
;;;; Předběžná verze, soubor bude ještě upraven.
;;;;


;;; Test callbacku :display v knihovně micro-graphics

#|
(setf mgw (mg:display-window))
|#

#|
(mg:set-callback mgw :display (lambda (w)
                                (print "Display")))
|#

;;; Následující potřebuje třídu eu-flag, která implementuje
;;; metodu set-black-and-white-p

(defclass eu-window (window)
  ())

(defmethod initialize-instance ((w eu-window) &key)
  (call-next-method)
  (set-shape w (make-instance 'eu-flag)))

#|
(setf w (make-instance 'eu-window))

(redraw w)
(set-black-and-white-p (shape w) t)
(redraw w)
|#

;;; Instalace callbacku :display ve třídě window

(defmethod initialize-instance ((w window) &key)
  (call-next-method)
  (set-shape w (make-instance 'empty-shape))
  (install-callbacks w)
  w)

#|
(install-callbacks w)
(set-black-and-white-p (shape w) nil)
|#

;;; Test callbacku :mouse-down v knihovně micro-graphics

#|
(setf mgw (mg:display-window))
(mg:set-callback mgw 
                 :mouse-down
                 (lambda (w button x y)
                   (format t "~%Mouse down: ~s ~s ~s" button x y)))
|#

;;; Instalace callbacků :display a :mouse-down ve třídě window

(defmethod install-callbacks ((w window))
  (mg:set-callback (slot-value w 'mg-window)
		   :display 
		   (lambda (mgw)
		     (declare (ignore mgw))
		     (redraw w)))
  (mg:set-callback (slot-value w 'mg-window) 
		   :mouse-down (lambda (mgw button x y)
				 (declare (ignore mgw))
				 (send-mouse-down 
				  w button x y)))
  w)

(defmethod send-mouse-down ((w window) button x y)
  (window-mouse-down w button (move (make-instance 'point) x y)))

(defmethod window-mouse-down ((w window) button position)
  nil)

(defmethod window-mouse-down ((w eu-window) button position)
  (set-black-and-white-p (shape w)
                         (not (black-and-white-p (shape w)))))

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
  (call-next-method)
  (mg:set-param (shape-mg-window pt) :filledp t)
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
  (call-next-method)
  (when (propagate-color-p p)
    (send-to-items-set-color p (color p)))
  p)

(defmethod set-items ((p picture) items)
  (call-next-method)
  (when (propagate-color-p p)
    (send-to-items-set-color p (color p)))
  p)

(defmethod check-item ((pic picture) item)
  (unless (typep item 'shape)
    (error "Invalid picture element type."))
  pic)

(defmethod set-window ((pic picture) value) 
  (send-to-items pic #'set-window value)
  (call-next-method))

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
  (call-next-method)
  (mg:set-param (shape-mg-window poly) 
                :closedp
                (closedp poly))
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
; rotujicí hvězda
;vkládání koleček
; vytváření polygonu
; left - vkládá body, righ - uzavře a vybarví; left nový polygon

(defclass star-window (window)
  ())

(defmethod window-mouse-down ((w star-window) button position)
  (rotate (shape w) (/ pi 18 (if (eql button :LEFT) -1 1)) position)
  (redraw w))

;(setf s-win (make-instance 'star-window))
;(setf star (make-star 12 30 50))
;(move star 60 60)
;(set-shape s-win star)
;(redraw s-win)

(defclass circle-window (window)
  ())

(defmethod window-mouse-down ((w circle-window) button position)
  ; pokud je v shape 'empty-shape, přepíšu ji třídou picture
  (if (not (typep (shape w) 'picture))
      (set-shape w (make-instance 'picture)))
  (let ((circ (set-window (make-instance 'circle) w))
        (pic (shape w)))
    (set-y (set-x (center (set-radius circ 20)) (x position)) (y position))
    (set-items pic (cons circ (items pic)))
    (redraw w)))

;(setf c-win (make-instance 'circle-window))
;(redraw c-win)


(defmethod make-rectangle (ref side-a side-b)
  (let ((p1 (make-instance 'point))
        (p2 (make-instance 'point))
        (p3 (make-instance 'point))
        (p4 (make-instance 'point))
        (my-poly (make-instance 'polygon)))
    (set-items my-poly (list
                        (set-x (set-y p1 0) 0)
                        (set-x (set-y p2 0) (* side-a ref))
                        (set-x (set-y p3 (* side-b ref)) (* side-a ref))
                        (set-x (set-y p4 (* side-b ref)) 0)))))

(defun shallow-copy-object (original)
  (let* ((class (class-of original))
         (copy (allocate-instance class)))
    (dolist (slot (mapcar #'slot-definition-name (class-slots class)))
      (when (slot-boundp original slot)
        (setf (slot-value copy slot)
              (slot-value original slot))))
    copy))

(defclass poly-window (window)
  ((tmp-poly :initform (set-closedp (make-instance 'polygon) NIL) :reader tmp-poly)
   (default-color :initform :CYAN :reader get-color)
   (colors :initform '(:RED :GREEN :CYAN :YELLOW :PURPLE :PINK :BLUE) :reader colors)))

(defmethod set-default-color ((w poly-window) color)
  (setf (slot-value w 'default-color) color))

(defmethod set-tmp-poly ((w poly-window) poly)
  (setf (slot-value w 'tmp-poly) poly))

(defmethod change-color ((w poly-window) p)
  (let ((colors (colors w)))
    (dotimes (x (list-length colors))
      (if (and (>= (x p) 0)
               (<= (x p) 40)
               (>= (y p) (* x 30))
               (<= (y p) (- (* (+ 1 x) 30) 1)))
          (set-default-color w (nth x colors))))
    (if (and (>= (x p) 0)
             (<= (x p) 40)
             (>= (y p) (* (+ 1 (list-length colors)) 30)))
        (set-default-color w :WHITE))))

(defmethod initialize-instance ((w poly-window) &key)
    (call-next-method)
    (let ((colors (colors w))
          (pic (make-instance 'picture)))
      (labels ((iterator (list count)
                 (if (>= count 0)
                     (iterator (cons (move (set-filledp (set-color (make-rectangle 10 4 3) (nth count colors)) T) 0 (* 30 count)) list)
                               (- count 1))
                   list)))
      (set-items pic (iterator '() (- (list-length colors) 1))))
      (set-shape w pic)))

(defmethod window-mouse-down ((w poly-window) button position)
  (let ((pic (shape w)))
    (if (eql button :LEFT)
        (if (and (>= (x position) 0)
                 (<= (x position) 39))
            (change-color w position)
          (progn
            (if (closedp (car (items pic)))
                (set-items pic (cons (set-closedp (make-instance 'polygon) NIL) (items pic))))
            (set-items (car (items pic)) (cons position (items (car (items pic)))))))
    (progn
      (set-color (set-closedp (set-filledp (car (items pic)) T) T)(get-color w))))
    (redraw w)))

(defvar p-win)
(setf p-win (make-instance 'poly-window))
(redraw p-win)


