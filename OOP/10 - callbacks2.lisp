;; -*- mode: lisp; encoding: utf-8; -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;
;;;; OOP - kód k přednášce 27. listopadu 2014
;;;; Události 1
;;;;
;;;; Reakce na změnu objektů, jednoduché klikání do okna (zatím bez
;;;; informování podřízeného grafického objektu)
;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Třída mg-object
;;;

(defclass mg-object () 
  ((delegate :initform nil)
   (events :initform '())
   (change-level :initform 0)))

(defmethod delegate ((obj mg-object))
  (slot-value obj 'delegate))

(defmethod set-delegate ((obj mg-object) delegate)
  (setf (slot-value obj 'delegate) delegate))

(defmethod events ((obj mg-object))
  (slot-value obj 'events))

(defun canonicalize-event (event) 
  (if (typep event 'symbol)
      (list event event) 
      event))

(defun canonicalize-events (events)
  (mapcar #'canonicalize-event events))

(defmethod set-events ((object mg-object) value) 
  (setf (slot-value object 'events) 
	(canonicalize-events value))
  object)

(defmethod remove-event ((obj mg-object) event)
  (setf (slot-value obj 'events)
	(remove-if (lambda (l)
		     (eql event (first l))) 
		   (slot-value obj 'events))))

(defmethod add-event ((obj mg-object) event)
  (remove-event obj event)
  (setf (slot-value obj 'events)
	(cons (canonicalize-event event)
	      (events obj))))

(defmethod find-event ((obj mg-object) event)
  (find-if (lambda (ev)
	     (eql event (car ev)))
	   (events obj)))

(defmethod send-event ((object mg-object) event 
		       &rest event-args) 
  (when (delegate object)
    (let ((ev (second (find-event object event)))) 
      (when ev 
	(apply ev (delegate object) object event-args)))))

(defmethod change ((object mg-object) msg &rest args)
  (unless (> (slot-value object 'change-level) 0) 
    (apply #'send-event object 'ev-change msg args)))

(defmethod changing ((object mg-object) msg &rest args)
  (unless (> (slot-value object 'change-level) 0)
    (apply #'send-event object 'ev-changing msg args)))

(defmethod call-without-changes ((object mg-object) function)
  (setf (slot-value object 'change-level) 
	(+ (slot-value object 'change-level) 1))
  (unwind-protect
       (funcall function)
    (setf (slot-value object 'change-level)
	  (- (slot-value object 'change-level) 1)))
  object)

(defmacro without-changes (object &body body)
  `(call-without-changes ,object (lambda () ,@body)))

(defmethod call-with-change 
    ((object mg-object) function message &rest args)
  (apply #'changing object message args)
  (without-changes object
    (funcall function))
  (apply #'change object message args)
  object)

(defmacro with-change ((object message &rest msg-args) 
		       &body body)
  `(call-with-change ,object
                     (lambda () ,@body)
                     ,message
                     ,@msg-args))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Třída shape
;;;

(defclass shape (mg-object)
  ((color :initform :black)
   (thickness :initform 1)
   (filledp :initform nil)
   (window :initform nil)))

(defmethod window ((shape shape)) 
  (slot-value shape 'window))

(defmethod set-window ((shape shape) value) 
  (setf (slot-value shape 'window) value))

(defmethod shape-mg-window ((shape shape))
  (when (window shape)
    (mg-window (window shape))))

(defmethod color ((shape shape)) 
  (slot-value shape 'color)) 

(defmethod do-set-color ((shape shape) value)
  (setf (slot-value shape 'color) value))

(defmethod set-color ((shape shape) value) 
  (with-change (shape 'set-color value)
    (do-set-color shape value))) 

(defmethod thickness ((shape shape)) 
  (slot-value shape 'thickness)) 

(defmethod do-set-thickness ((shape shape) value) 
  (setf (slot-value shape 'thickness) value)) 

(defmethod set-thickness ((shape shape) value)
  (with-change (shape 'set-thickness value)
    (do-set-thickness shape value)))

(defmethod filledp ((shape shape))
  (slot-value shape 'filledp))

(defmethod do-set-filledp ((shape shape) value)
  (setf (slot-value shape 'filledp) value))

(defmethod set-filledp ((shape shape) value)
  (with-change (shape 'set-filledp value)
    (do-set-filledp shape value)))

(defmethod do-move ((shape shape) dx dy)
  shape)

(defmethod move ((shape shape) dx dy)
  (with-change (shape 'move dx dy)
    (do-move shape dx dy)))

(defmethod do-rotate ((shape shape) angle center)
  shape)

(defmethod rotate ((shape shape) angle center)
  (with-change (shape 'rotate angle center)
    (do-rotate shape angle center)))

(defmethod do-scale ((shape shape) coeff center)
  shape)

(defmethod scale ((shape shape) coeff center)
  (with-change (shape 'scale coeff center)
    (do-scale shape coeff center)))

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Třída point
;;;

(defclass point (shape) 
  ((x :initform 0) 
   (y :initform 0)))

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
    (error "Wrong parameter type"))
  (with-change (point 'set-x value)
    (setf (slot-value point 'x) value)))

(defmethod set-y ((point point) value) 
  (unless (typep value 'number)
    (error "Wrong parameter type"))
  (with-change (point 'set-y value)
    (setf (slot-value point 'y) value)))

(defmethod r ((point point)) 
  (let ((x (slot-value point 'x)) 
        (y (slot-value point 'y))) 
    (sqrt (+ (* x x) (* y y)))))

(defmethod phi ((point point)) 
  (let ((x (slot-value point 'x)) 
        (y (slot-value point 'y))) 
    (cond ((plusp x) (atan (/ y x))) 
          ((minusp x) (+ pi (atan (/ y x)))) 
          (t (* (signum y) (/ pi 2))))))

(defmethod set-r-phi ((point point) r phi) 
  (with-change (point 'set-r-phi r phi)
    (setf (slot-value point 'x) (* r (cos phi)) 
	  (slot-value point 'y) (* r (sin phi))) 
    point))

(defmethod set-r ((point point) value) 
  (unless (>= value 0)
    (error "Point radius should be non-negative"))
  (with-change (point 'set-r value)
    (set-r-phi point value (phi point)) 
    value))

(defmethod set-phi ((point point) value) 
  (with-change (point 'set-phi value) 
    (set-r-phi point (r point) value) 
    value))

;;
;; Transformace
;;

(defmethod do-move ((pt point) dx dy)
  (set-x pt (+ (x pt) dx))
  (set-y pt (+ (y pt) dy))
  pt)

(defmethod do-rotate ((pt point) angle center)
  (let ((cx (x center))
        (cy (y center)))
    (move pt (- cx) (- cy))
    (set-phi pt (+ (phi pt) angle))
    (move pt cx cy)))

(defmethod do-scale ((pt point) coeff center)
  (let ((cx (x center))
        (cy (y center)))
    (move pt (- cx) (- cy))
    (set-r pt (* (r pt) coeff))
    (move pt cx cy)))

;;
;; Kreslení
;;

;; U bodu kreslíme plnou kružnici s poloměrem rovným thickness
(defmethod set-mg-params ((pt point))
  (call-next-method)
  (mg:set-param (shape-mg-window pt) :filledp t))

(defmethod do-draw ((pt point)) 
  (mg:draw-circle (shape-mg-window pt) 
                  (x (x pt)) 
                  (y (y pt)) 
                  (thickness pt)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Třída circle
;;;

(defclass circle (shape) 
  ((center :initform (make-instance 'point)) 
   (radius :initform 1)))

(defmethod radius ((c circle)) 
  (slot-value c 'radius)) 

(defmethod set-radius ((c circle) value)
  (with-change (c 'set-radius value)
    (setf (slot-value c 'radius) value)))

(defmethod center ((c circle)) 
  (slot-value c 'center))

(defmethod initialize-instance ((c circle) &rest args)
  (call-next-method)
  (let ((center (center c)))
    (set-events center '(ev-changing ev-change))
    (set-delegate center c))
  c)

;;
;; Kreslení
;;

(defmethod do-draw ((c circle))
  (mg:draw-circle (shape-mg-window c)
                  (x (center c))
                  (y (center c))
                  (radius c)))
;;
;; Transformace
;;

(defmethod do-move ((c circle) dx dy)
  (move (center c) dx dy)
  c)

(defmethod do-rotate ((c circle) angle center)
  (rotate (center c) angle center)
  c)

(defmethod do-scale ((c circle) coeff center)
  (scale (center c) coeff center)
  (set-radius c (* (radius c) coeff))
  c)

;;
;; Události:
;;

(defmethod ev-changing ((c circle) sender message 
			&rest message-args)
  (changing c 'ev-changing sender message message-args))

(defmethod ev-change ((c circle) sender message 
		      &rest message-args)
  (change c 'ev-change sender message message-args))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; compound-shape
;;;

(defclass compound-shape (shape)
  ((items :initform '())))

(defmethod items ((shape compound-shape)) 
  (copy-list (slot-value shape 'items)))

(defmethod send-to-items ((shape compound-shape) message &rest arguments)
  (dolist (item (items shape))
    (apply message item arguments)))

(defmethod check-item ((shape compound-shape) item)
  (error "Method check-item has to be rewritten"))

(defmethod check-items ((shape compound-shape) item-list)
  (dolist (item item-list)
    (check-item shape item)))

(defmethod do-set-items ((shape compound-shape) value)
  (setf (slot-value shape 'items) (copy-list value))
  (send-to-items shape #'set-window (window shape))
  (send-to-items shape #'set-delegate shape)
  (send-to-items 
    shape #'set-events '(ev-changing ev-change)))

(defmethod set-items ((shape compound-shape) value)
  (check-items shape value)
  (with-change (shape 'set-items value)
    (do-set-items shape value))
  shape)

;;
;; Transformace
;;

(defmethod do-move ((shape compound-shape) dx dy)
  (send-to-items shape #'move dx dy)
  shape)

(defmethod do-rotate ((shape compound-shape) angle center)
  (send-to-items shape #'rotate angle center)
  shape)

(defmethod do-scale ((shape compound-shape) coeff center)
  (send-to-items shape #'scale coeff center)
  shape)

;;
;; Události
;;

(defmethod ev-changing ((cs compound-shape) sender message 
			&rest message-args)
  (changing cs 'ev-changing sender message message-args))

(defmethod ev-change ((cs compound-shape) sender message 
		      &rest message-args)
  (change cs 'ev-change sender message message-args))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Třída picture
;;;

(defclass picture (compound-shape)
  ((propagate-color-p :initform nil)))

;;
;; Sloty atd.
;;

(defmethod propagate-color-p ((p picture))
  (slot-value p 'propagate-color-p))

(defmethod send-to-items-set-color ((p picture) color)
  (send-to-items p #'set-color color)
  color)

(defmethod set-propagate-color-p ((p picture) value)
  (with-change (p 'set-propagate-color-p value)
    (setf (slot-value p 'propagate-color-p) value)
    (when value
      (send-to-items-set-color p (color p)))
    value))

(defmethod do-set-color ((p picture) color)
  (call-next-method)
  (when (propagate-color-p p)
    (send-to-items-set-color p (color p)))
  color)

(defmethod do-set-items ((p picture) items)
  (call-next-method)
  (when (propagate-color-p p)
    (send-to-items-set-color p (color p)))
  (send-to-items p #'add-event 'ev-mouse-down)
  items)

(defmethod check-item ((pic picture) item)
  (unless (typep item 'shape)
    (error "Invalid picture element type.")))

(defmethod set-window ((pic picture) value) 
  (send-to-items pic #'set-window value)
  (call-next-method))

;;
;; Kreslení
;;

(defmethod do-draw ((pic picture))
  (dolist (item (reverse (items pic)))
    (draw item)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Třída polygon
;;;

(defclass polygon (compound-shape)
  ((closedp :initform t)))

;;
;; Sloty
;;

(defmethod check-item ((p polygon) item)
  (unless (typep item 'point)
    (error "Invalid polygon element type.")))

(defmethod closedp ((p polygon))
  (slot-value p 'closedp))

(defmethod set-closedp ((p polygon) value)
  (with-change (p 'set-closed-p value)
    (setf (slot-value p 'closedp) value)))

;;
;; Kreslení
;;

(defmethod set-mg-params ((poly polygon)) 
  (call-next-method)
  (mg:set-param (shape-mg-window poly) :closedp (closedp poly)))

(defmethod do-draw ((poly polygon)) 
  (let (coordinates)
    (dolist (point (reverse (items poly)))
      (setf coordinates (cons (y point) coordinates))
      (setf coordinates (cons (x point) coordinates)))
    (mg:draw-polygon (shape-mg-window poly) 
                     coordinates)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; empty-shape
;;;

(defclass empty-shape (shape)
  ())

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; full-shape
;;;

(defclass full-shape (shape) 
  ())

(defmethod set-mg-params ((shape full-shape)) 
  (mg:set-param (shape-mg-window shape) :background (color shape)))

(defmethod do-draw ((shape full-shape))
  (mg:clear (shape-mg-window shape)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Třída window
;;;

(defclass window (mg-object)
  ((mg-window :initform (mg:display-window))
   shape
   (background :initform :white)))

(defmethod mg-window ((window window))
  (slot-value window 'mg-window))

(defmethod shape ((w window))
  (slot-value w 'shape))

(defmethod set-shape ((w window) shape)
  (with-change (w 'set-shape shape)
    (setf (slot-value w 'shape) shape)
    (set-window shape w)
    (set-delegate shape w)
    (set-events shape '(ev-change))
    (invalidate w)))

(defmethod background ((w window))
  (slot-value w 'background))

(defmethod set-background ((w window) color)
  (with-change (w 'set-background color)
    (setf (slot-value w 'background) color)
    (invalidate w)))

(defmethod redraw ((window window))
  (let ((mgw (slot-value window 'mg-window)))
    (mg:set-param mgw :background (background window))
    (mg:clear mgw)
    (draw (shape window)))
  window)

(defmethod invalidate ((w window))
  (mg:invalidate (mg-window w))
  w)

(defmethod send-mouse-down ((w window) button x y)
  (window-mouse-down w
		     button 
		     (move (make-instance 'point) x y)))

(defmethod install-callbacks ((w window))
  (mg:set-callback (slot-value w 'mg-window)
		   :display (lambda (mgw)
                              (declare (ignore mgw))
                              (redraw w)))
  (mg:set-callback 
   (slot-value w 'mg-window) 
   :mouse-down (lambda (mgw button x y)
		 (declare (ignore mgw))
		 (send-mouse-down w button x y)))
  w)

(defmethod initialize-instance ((w window) &key)
  (call-next-method)
  (set-shape w (make-instance 'empty-shape))
  (install-callbacks w)
  w)

(defmethod window-mouse-down ((w window) button position)
  nil)

;;
;; Události
;;

(defmethod ev-change ((w window) sender message &rest args)
  (invalidate w))

#|
(setf win (make-instance 'window))

(setf circ (make-instance 'circle))
(set-radius circ 100)

(set-shape win circ)

(scale circ 1/2 (center circ))
(move circ 100 100)
|#

(defclass test-delegate (mg-object)
  ())

(defmethod initialize-instance ((td test-delegate) &rest args)
  (call-next-method)
  (set-events td '(ev-change))
  td)

(defmethod ev-change ((td test-delegate) sender message 
		      &rest message-args)
  (format t "~%CHANGE Object: ~s Message: ~s Arguments: ~s~%" sender message message-args))

(setf poly (make-instance 'polygon))
(set-items poly (list (make-instance 'point) (move (make-instance 'point) 20 20) (move (make-instance 'point) 10 10)))

(setf a (make-instance 'point))
(setf delegate (make-instance 'test-delegate))
(set-delegate a delegate)
(set-events a '(ev-change))
(set-delegate poly delegate)
(set-events poly '(ev-change))

#| udělat kolečko v krabici, při změně kolečka se zmenší krabice |#

(defmethod make-square ((p polygon) side-a side-b)
  (let ((p1 (make-instance 'point))
        (p2 (make-instance 'point))
        (p3 (make-instance 'point))
        (p4 (make-instance 'point)))
    (set-x p1 (- (/ side-a 2)))
    (set-y p1 (-(/ side-b 2)))
    (set-x p2 (/ side-a 2))
    (set-y p2 (- (/ side-b 2)))
    (set-x p3 (/ side-a 2))
    (set-y p3 (/ side-b 2))
    (set-x p4 (- (/ side-b 2)))
    (set-y p4 (/ side-a 2))
    (set-items p (list p1 p2 p3 p4))
    p))



(defclass bordered-circle (picture)
  ((moving :initform NIL :reader moving)))

(defmethod set-moving ((b bordered-circle) bool)
  (setf (slot-value b 'moving) bool))

(defmethod initialize-instance ((b bordered-circle) &rest args)
  (call-next-method)
  (let ((circ (make-instance 'circle))
        (box (make-square (make-instance 'polygon) 2 2)))
    (set-items b (list box circ))
    b))

(defmethod ev-change ((btd bordered-circle) sender message &rest message-args)
  (call-next-method)
  (if (not (moving btd))
      (let* ((circ (get-circ btd))
             (box (get-box btd))
             (center (center circ))
             (r (radius circ))
             (max-x (apply #'max (mapcar (lambda (x) (x x)) (items box))))
             (min-x (apply #'min (mapcar (lambda (x) (x x)) (items box))))
             (max-y (apply #'max (mapcar (lambda (x) (y x)) (items box))))
             (min-y (apply #'min (mapcar (lambda (x) (y x)) (items box))))
             (b-center (set-y (set-x (make-instance 'point) (/ (+ min-x max-x) 2)) (/ (+ min-y max-y) 2))))
        (set-moving btd T)
        (unless (= (abs (/ (- max-x min-x) 2)) r)
            (scale box (/ r (abs (/ (- max-x min-x) 2))) b-center))
        (move box (- (x center) (x b-center)) (- (y center) (y b-center)))
        (set-moving btd NIL))))


(defmethod get-circ ((b bordered-circle))
  (nth 1 (items b)))

(defmethod get-box ((b bordered-circle))
  (nth 0 (items b)))

(defmethod scale-circ ((b bordered-circle) ratio)
  (scale (get-circ b) ratio (center (get-circ b))))

(setf win (make-instance 'window))
(setf b (make-instance 'bordered-circle))
;(scale b 100 (make-instance 'point))
(set-shape win b)

;bodovaný úkol
; vytvořit drag n drop na objekty
; tři typy objektů 
; - kolečko - soubor
; - čtverec - složka
; - trojuhelník - aplikace
; přetáhnutí souboru do složky - soubor zmizí a vloží se do složky
; aplikace do složky se vloží do složky
; zobracení zpráv o tom, co se stalo
; soubor do aplikace - spuštění
; + posouvání