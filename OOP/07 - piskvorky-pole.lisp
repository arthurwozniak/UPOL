;; -*- mode: lisp; encoding: utf-8; -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;
;;;; OOP - kód k přednášce 6. listopadu 2014
;;;; Dědičnost 2 (s voláním zděděné metody)
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

; *scale* určuje měřítko
(defvar *scale*)
(setf *scale* 100)

(defvar *triplets*)
(setf *triplets*
      '((0 1 2) (3 4 5) (6 7 8) ;Horizontalne
       (0 3 6) (1 4 7) (2 5 8) ;Vertikale
       (0 4 8) (2 4 6)))

(defclass changable-picture (picture)
  ((visible-list :initform NIL)))

(defmethod visible-list ((c-picture changable-picture))
  (copy-list (slot-value c-picture 'visible-list)))

(defmethod set-visible-list ((c-picture changable-picture) list)
  (unless (and (typep list 'CONS)
               (eql (length list) (length (items c-picture))))
    (error "Invalid parameter argument"))
  (setf (slot-value c-picture 'visible-list) (copy-list list)))

(defmethod set-items ((c-picture changable-picture) items)
  (call-next-method)
  (set-visible-list c-picture (make-list (length items) :initial-element T)))

(defmethod draw ((c-picture changable-picture))
  (let ((reversed (reverse (items c-picture)))
        (visibles (visible-list c-picture)))
    (dotimes (i (length reversed))
      (if (nth i visibles)
          (draw (nth i reversed))))))
                  
; metoda třídy shape pro vyvolávání chyb 
(defmethod raise-error ((sh shape) message)
  (capi:display-message message))
  
(defclass field (changable-picture) 
  ((state :initform NIL
          :reader state)))

(defmethod make-circle ()
  (let ((circ (make-instance 'circle)))
    (set-x (set-y (center circ) (/ 6)) (/ 6))
    (set-radius circ (/ 3 24))))

(defmethod make-cross ()
  (let ((my-pic (make-instance 'picture))
        (poly (make-instance 'polygon))
        (poly2 (make-instance 'polygon)))
    (set-items my-pic 
               (list 
                (set-items poly 
                           (let ((p1 (make-instance 'point))
                                 (p2 (make-instance 'point)))
                             (list 
                              (set-x (set-y p1 (/ 12))  (/ 12))
                              (set-x (set-y p2 (/ 3 12)) (/ 3 12)))))
                (set-items poly2
                           (let ((p1 (make-instance 'point))
                                 (p2 (make-instance 'point)))
                             (list 
                              (set-x (set-y p2 (/ 3 12)) (/ 12))
                              (set-x (set-y p1 (/ 1 12)) (/ 3 12)))))))))

(defmethod initialize-instance ((sq field) &key)
  (call-next-method)
  (set-items sq (list (make-cross) (make-circle) (make-rectangle 1 (/ 1 3) (/ 1 3))))
  (set-state sq NIL))

(defmethod is-occupied-p ((sq field))
  (if (state sq)
      T
    NIL))

(defmethod state-check ((sq field) state)
  (unless (or (eql state :CIRC)
              (eql state :CROSS)
              (eql state NIL))
    (raise-error sq "Invalid state argumets")))

(defmethod set-state ((sq field) state)
  (state-check sq state)
  (set-visible-list-by-state sq state)
  (setf (slot-value sq 'state) state))

(defmethod set-visible-list-by-state ((sq field) state)
  (cond ((eql state :CIRC)
         (set-visible-list sq '(T T NIL)))        
        ((eql state :CROSS)
         (set-visible-list sq '(T NIL T)))
        (t (set-visible-list sq '(T NIL NIL)))))

#|-------
  |0|1|2|
  -------
  |3|4|5|
  -------
  |6|7|8|
  ------- |#

(defclass graphic-board (picture) 
  ((triplets :initform '((0 1 2) (3 4 5) (6 7 8) ;Horizontalne
                         (0 3 6) (1 4 7) (2 5 8) ;Vertikale
                         (0 4 8) (2 4 6))
             :reader triplets) ;Diagonalne
   ))

(defmethod state-check ((board graphic-board) state)
  (unless (or (eql state :CIRC)
              (eql state :CROSS)
              (eql state NIL))
    (raise-error sq "Invalid state argumets")))

(defmethod initialize-instance ((board graphic-board) &key)
  (call-next-method)
            (let ((size 3)
                  (items-list NIL))
              (dotimes (x (* size size))
                (setf items-list (cons (make-instance 'field) items-list)))
              (dotimes (x size)
                (dotimes (y size)
                  (move (nth (+ (* size x) y) items-list)
                        (* y 1/3) (* x 1/3))))
              (set-items board items-list)
              (scale board *scale* (make-instance 'point)))) ; nastavení měřítka desky

; metoda očekává pouze interakci s uživatelem, jeho znak bude vždy X
(defmethod player-move ((board graphic-board) pos)
  
  (unless (typep pos 'FIXNUM)
    (raise-error board "Parameter pos is not integer")
    (mg:close-window (window board)) ; nezavře se
    (player-move board (ask-for-number board)))

  (if (= pos -1)
      (progn
        (raise-error board "Game terminated")
        NIL)
    (progn
      (unless (not (state (nth pos (items board))))
        (raise-error board "Sorry, field is already taken")
        (player-move board (ask-for-number board)))

      (set-state (nth pos (items board)) :CROSS)
      (redraw (window board))

      (cond ((check-triplets-p board :CROSS)
             (capi:display-message "You win")
             (if (y-or-n-p "Would you like to play again?")
                 (new-game board)))
            ((not (possible-win-p board :CROSS))
             (capi:display-message "Tie game")
             (if (y-or-n-p "Would you like to play again?")
                 (new-game board)))
            (t (computer-move board))))))

(defmethod full-board-p ((board graphic-board))
  (let ((full T))
    (dolist (x (items board))
      (if (eql (state x) NIL)
          (setf full NIL)))
    full))

(defmethod possible-win-p ((board graphic-board) state)
  (if (some (lambda (x) (make-triplet-sum board x state)) (triplets board))
      T
    NIL))

(defmethod check-triplet-win-p ((board graphic-board) triplet state)
  (state-check board state)
  (let ((items (items board)))
    (every (lambda (x) (eql state (state (nth x items)))) triplet)))

(defmethod make-triplet-sum ((board graphic-board) triplet state)
  (let* ((items (items board))
         (triplet-eval (map 'list (lambda (x) (cond ((eql (state (nth x items)) state) 1)
                                                    ((not (state (nth x items))) 0)
                                                    (t :F))) triplet)))
    (if (find :F triplet-eval)
        NIL
      (list (apply '+ triplet-eval) triplet triplet-eval))))

(defmethod computer-best-choice ((board graphic-board))
  (let ((triplets-eval (map 'list (lambda (x) (make-triplet-sum board x :CIRC)) (triplets board))) ; namapuje na triplet počet již obsazených polí
        (best-pos NIL))
    
    (setf triplets-eval (remove nil triplets-eval)) ; odstraní ty, na kterých se nedá vyhrát
    (setf triplets-eval (sort triplets-eval #'> :key #'car)) ; setřídí od největší sumy
    (setf triplets-eval (remove-if-not #'(lambda (x) (eql (car x) (caar triplets-eval))) triplets-eval)) ; odstraní duplikáty největších
    (if (not triplets-eval) ; pokud není možné vyhrát, vrátí první volné pole
        (progn 
          (dotimes (x 9)
            (if (not (state (nth x (items board))))
                (progn
                  (setf best-pos x)
                  (return))))
          best-pos)
      (progn
        (setf triplets-eval (nth (random (list-length triplets-eval)) triplets-eval))
        (dotimes (x (length (nth 1 triplets-eval)))
          (if (and (eql 0 (nth x (nth 2 triplets-eval)))
                   (not best-pos))
              (setf best-pos (nth x (nth 1 triplets-eval)))))
        best-pos))))
  
(defmethod computer-move ((board graphic-board))
  (let ((pos (computer-best-choice board)))
    (set-state (nth pos (items board)) :CIRC)
    (redraw (window board))
    (cond ((check-triplets-p board :CIRC)
           (capi:display-message "You lose")
           (if (y-or-n-p "Would you like to play again?")
               (new-game board)))
          ((not (possible-win-p board :CIRC))
           (capi:display-message "Tie game")
           (if (y-or-n-p "Would you like to play again?")
               (new-game board)))
          (t (player-move board (ask-for-number board))))))

(defmethod check-triplets-p ((board graphic-board) state)
  (state-check board state)
  (some (lambda (x) (check-triplet-win-p board x state)) (triplets board)))

(defmethod ask-for-number ((board graphic-board))
  (let ((num (capi:prompt-for-integer
              "Enter field number (1 - 9)"
              :min 1 :max 9)))
  (if num 
      (- num 1)
    -1)))
    

(defmethod clean-board ((board graphic-board))
  (dolist (field (items board))
    (set-state field NIL)))

(defmethod new-game ((board graphic-board))
  (clean-board board)
  (if (y-or-n-p "Would you like to go first? ")
      (player-move graphic-board (ask-for-number board))
    (computer-move graphic-board)))

(setf win (make-instance 'window))

(setf graphic-board (make-instance 'graphic-board))
(set-shape win graphic-board)
(redraw win)
(new-game graphic-board)
