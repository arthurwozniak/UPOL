
(defmethod make-rectangle ((p polygon) side-a side-b)
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
    (set-x p4 (- (/ side-a 2)))
    (set-y p4 (/ side-b 2))
    (set-items p (list p1 p2 p3 p4))
    p))

(defun random-color ()
  (let ((colors (color:get-all-color-names)))
    (nth (random (length colors)) colors)))

(defclass app (polygon movable-shape)
  ())

(defmethod initialize-instance ((a app) &rest args)
  (call-next-method)
  (set-items a (list
                (move (make-instance 'point) 0 -30)
                (move (make-instance 'point) -30 30)
                (move (make-instance 'point) 30 30)))
  (set-filledp a T)
  (set-color a (random-color)))

(defclass file (circle movable-shape)
  ())

(defmethod initialize-instance ((f file) &rest args)
  (call-next-method)
  (set-filledp (set-radius f 30) T)
  (set-color f (random-color)))

(defclass dir (polygon movable-shape)
  ((hidden-items :initform NIL :reader hidden-items)))

(defmethod set-hidden-items ((d dir) items)
  (setf (slot-value d 'hidden-items) items))

(defmethod initialize-instance ((d dir) &rest args)
  (call-next-method)
  ;(make-rectangle d 30 40)
  (set-items d (list (move (make-instance 'point) 5 0)
                     (move (make-instance 'point) 15 0)
                     (move (make-instance 'point) 18 5)
                     (move (make-instance 'point) 45 5)
                     (move (make-instance 'point) 45 40)
                     (move (make-instance 'point) 0 40)
                     (move (make-instance 'point) 0 5)
                     (move (make-instance 'point) 2 5)))
  (set-filledp d T)
  (set-color d (random-color)))

(defclass movable-shape (shape)
  ((moving :initform NIL :reader moving)
   (original-pos :initform NIL :reader original-pos)
   (pos :initform NIL :reader pos)))

(defmethod initialize-instance ((ms movable-shape) &rest args)
  (call-next-method)
  (add-event ms 'EV-DIR-RELEASED))

(defmethod set-moving ((ms movable-shape))
  (setf (slot-value ms 'moving) T))

(defmethod reset-moving ((ms movable-shape))
  (setf (slot-value ms 'moving) NIL))

(defmethod set-pos ((ms movable-shape) p)
  (setf (slot-value ms 'pos) p))

(defmethod set-original-pos ((ms movable-shape) p)
  (setf (slot-value ms 'original-pos) p))

(defmethod mouse-down ((ms movable-shape) button position)
  (set-original-pos ms position)
  (when (eql button :LEFT)
    (set-pos ms position)
    (set-moving ms)
    (print "trololo"))
  (when (eql button :RIGHT)
    (print "delegat")
    (print (delegate ms))
    (when (typep ms 'dir) 
      (send-event ms 'ev-dir-released (hidden-items ms))
      (set-hidden-items ms NIL))
  (call-next-method)))

(defmethod mouse-up ((ms movable-shape) button position)
  (when (eql button :LEFT)
  (reset-moving ms)
  (print "tralala")))

(defmethod mouse-move ((ms movable-shape) button position)
  (if (moving ms)
      (progn
        (move ms (- (x position) (x (pos ms))) (- (y position) (y (pos ms))))
        (set-pos ms position)
        ;(format T "~% X: ~s Y: ~s" (x position) (y position))
)))

(defclass drag-n-drop (picture)
  ((selected-object :initform NIL :reader selected-object)))

(defmethod set-selected-object ((d drag-n-drop) object)
  (setf (slot-value d 'selected-object) object))

(defmethod initialize-instance ((d drag-n-drop) &rest args)
  (call-next-method)
  (add-event d 'EV-DIR-RELEASED))

; upravení mouse-down pro drag-n-drop picture
; při kliknutí je nutné přesunout objekt na první místo v seznamu, aby překryl vše ostatní
(defmethod mouse-down ((d drag-n-drop) button position)
  (let ((item (find-if (lambda (it) 
			 (contains-point-p it position)) 
		       (items d))))
    (when item
      (set-selected-object d item)
      (set-items d (cons item (remove-if (lambda (x) (eql x item)) (items d))))
      (mouse-down item button position))))

(defmethod mouse-up ((d drag-n-drop) button position)
  (if (selected-object d)
      (set-items d (remove-if (lambda (x) (eql x (selected-object d))) (items d))))
  (let ((item (find-if (lambda (it) 
			 (contains-point-p it position)) 
		       (items d)))
        (so (selected-object d)))
    
    (cond ((and (or (typep so 'file) (typep so 'dir) (typep so 'app))
                (typep item 'dir))
           (capi:display-message "Objekt ~s byl presunut na slozku ~s" so item)
           (set-hidden-items item (cons so (hidden-items item))))
          ((and (typep so 'file) (typep item 'app))
           (capi:display-message "Aplikace ~s byla spuštěna se souborem ~s" item so)
           (set-items d (cons so (items d)))
           (move so (- (x (original-pos so)) (x position)) (- (y (original-pos so)) (y position))))
          (t (set-items d (cons so (items d)))))
    (when (and item (not so))
      (mouse-up item button position))
    (when so
      (mouse-up so button position))))

(defmethod ev-dir-released ((d drag-n-drop) sender items)
  (if items
      (dolist (x items)
        (set-items d (cons (move x (- (x (original-pos x)) (x (pos x))) (- (y (original-pos x)) (y (pos x))))
                           (items d))))))


(setf w (make-instance 'window))
(setf f (make-instance 'drag-n-drop))
(set-items f (list (move (make-instance 'file) 40 40) (move (make-instance 'file) 100 40) (move (make-instance 'dir) 10 80) (move (make-instance 'dir) 60 80) (move (make-instance 'app) 140 100)))
(set-shape w f)
#|
všechny položky v jedné třídě typu picture
po puštění objektu přesunou zpět, zkontrolovat zda je pod puštěnou pozicí něco, a přesunou zpět
(setf w (make-instance 'window))
(setf d (make-instance 'dir))
(setf f (make-instance 'drag-n-drop))
(set-shape w f)
|#