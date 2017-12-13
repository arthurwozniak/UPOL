;; -*- mode: lisp; encoding: utf-8; -*-

;; Pomocné funkce
(defun cycle-list (list)
  (append (rest list) (list (first list))))

;; Body

(defclass point ()
  ((coordinates :reader coordinates)))

(defun point (x-coordinate &rest rest-coordinates)
  (unless (every #'numberp (cons x-coordinate rest-coordinates))
    (error "The coordinates must be numbers."))
  (let ((point (make-instance 'point)))
    (setf (slot-value point 'coordinates) (cons x-coordinate rest-coordinates))
    point))

(defmethod dimension ((point point))
  (length (coordinates point)))

(defmethod x ((point point))
  (first (coordinates point)))

(defmethod y ((point point))
  (unless (>= (dimension point) 2)
    (error "The point must have dimension at least two."))
  (second (coordinates point)))

(defmethod z ((point point))
  (unless (>= (dimension point) 3)
    (error "The point must have dimension at least three."))
  (third (coordinates point)))

;; Vektory

(defclass vect ()
  ((coordinates :reader coordinates)))

(defun vect (x-coordinate &rest rest-coordinates)
  (unless (every #'numberp (cons x-coordinate rest-coordinates))
    (error "The coordinates must be numbers."))
  (let ((vector (make-instance 'vect)))
    (setf (slot-value vector 'coordinates) (cons x-coordinate rest-coordinates))
    vector))

(defmethod dimension ((vector vect))
  (length (coordinates vector)))

(defmethod x ((vector vect))
  (first (coordinates vector)))

(defmethod y ((vector vect))
  (unless (>= (dimension vector) 2)
    (error "The vector must have dimension at least two."))
  (second (coordinates vector)))

(defmethod z ((vector vect))
  (unless (>= (dimension vector) 3)
    (error "The vector must have dimension at least three."))
  (third (coordinates vector)))

;; Operace s body a vektory

(defmethod minus ((p1 point) (p2 point))
  (unless (= (dimension p1) (dimension p2))
    (error "Points must have the same dimension."))
  (apply #'vect 
         (mapcar #'- 
                 (coordinates p1)
                 (coordinates p2))))

(defmethod plus ((p point) (v vect))
  (unless (= (dimension p) (dimension v))
    (error "The point must have the same dimenstion as the vector."))
  (apply #'point 
         (mapcar #'+ 
                 (coordinates p)
                 (coordinates v))))

(defmethod plus ((v1 vect) (v2 vect))
  (unless (= (dimension v1) (dimension v2))
    (error "Vectors must have the same dimenstion."))
  (apply #'vect 
         (mapcar #'+ 
                 (coordinates v1)
                 (coordinates v2))))

(defmethod mult (coef (v vect))
  (apply #'vect (mapcar (lambda (coord) (* coef coord)) (coordinates v))))

(defmethod phi ((vector vect))
  (unless (= (dimension vector) 2)
    (error "The vector must have dimension two."))
  (let ((x (x vector))
        (y (y vector)))
    (cond
     ((plusp x) (atan (/ y x))) 
     ((minusp x) (+ pi (atan (/ y x)))) 
     (t (* (signum y) (/ pi 2))))))

(defmethod rotate ((vector vect) angle &optional (rotation-vector (vect 0 0 1)))
  (unless (<= 2 (dimension vector) 3)
    (error "The vector must have dimension two or three."))
  (if (= (dimension vector) 2)
      (let ((phi (+ (phi vector) angle))
            (r (sqrt (+ (expt (x vector) 2)
                        (expt (y vector) 2)))))
        (vect (* r (cos phi))
              (* r (sin phi))))
    (progn
      (unless (= (dimension rotation-vector) 3)
        (error "rotation-vector must have dimension three."))
      (let* ((r-vector (normalize rotation-vector))
             (x (x r-vector))
             (y (y r-vector))
             (z (z r-vector))
             (vx (x vector))
             (vy (y vector))
             (vz (z vector))
             (c (cos angle))
             (s (sin angle)))
        (vect
         (+
          (* vx
             (+ 
              (* x x (- 1 c))
              c))
          (* vy
             (- 
              (* x y (- 1 c))
              (* z s)))
          (* vz
             (+
              (* x z (- 1 c))
              (* y s))))
         (+
          (* vx
             (+ (* y x (- 1 c))
                (* z s)))
          (* vy
             (+ (* y y (- 1 c))
                c))
          (* vz
             (- (* y z (- 1 c))
                (* x s))))
         (+
          (* vx
             (- (* z x (- 1 c))
                (* y s)))
          (* vy
             (+ (* z y (- 1 c))
                (* x s)))
          (* vz
             (+ (* z z (- 1 c))
                c))))))))

(defmethod cross-product ((u vect) (v vect))
  (unless (= 3 (dimension u) (dimension v))
    (error "The vectors must have dimension three."))
  (vect (- (* (y u) (z v))
           (* (z u) (y v)))
        (- (* (z u) (x v))
           (* (x u) (z v)))
        (- (* (x u) (y v))
           (* (y u) (x v)))))

(defmethod dot-product ((u1 vect) (u2 vect))
  (unless (= (dimension u1)
             (dimension u2))
    (error "The vectors must have the same dimension."))
  (reduce #'+ (mapcar #'* (coordinates u1) (coordinates u2))))

(defmethod norm ((u vect))
  (sqrt (dot-product u u)))

(defmethod normalize (u)
  (mult (/ 1 (norm u)) u))

(defmethod minus-origin ((p point))
  (minus p (apply #'point (make-list (dimension p) :initial-element 0))))

(defmethod plus-origin ((v vect))
  (plus (apply #'point (make-list (dimension v) :initial-element 0)) v))
 

;; OpenGL
(defvar *inside-opengl-block* nil)
(defvar *canvas*)

(defun resize-canvas (canvas x y width height)
  (declare (ignore x y))
  (opengl:rendering-on (canvas)       
    (when (zerop height) (setf height 1))
    (opengl:gl-viewport 0 0 width height)
    (opengl:gl-matrix-mode opengl:*gl-projection*)
    (opengl:gl-load-identity)
    (opengl:gl-ortho 0.0d0 (coerce width 'double-float) 0.0d0 (coerce height 'double-float) -1000.0d0 1000.0d0))
  (invalidate canvas))

(defun canvas-height ()
  (capi::pane-height *canvas*))

(defun canvas-width ()
  (capi::pane-width *canvas*))


(defun display-opengl-interface (name)
  (capi:display (make-instance name)))

(defmacro render-on ((opengl-pane) &body body)
  `(opengl:rendering-on (,opengl-pane)
     (opengl:gl-clear-color 1.0 1.0 1.0 1.0) 
     (opengl:gl-clear opengl:*gl-color-buffer-bit*)
     (opengl:gl-clear opengl:*gl-depth-buffer-bit*)
     (opengl:gl-depth-func opengl:*gl-less*)
     (when (= 3 (slot-value *canvas* 'dimension))
       (opengl:gl-enable opengl:*gl-depth-test*))
     ,@body
     (opengl:gl-flush)))


(defclass opengl-canvas (opengl:opengl-pane)
  ((dimension :initform 2)
   base-stack
   base))
   

(defmethod display ((canvas opengl-canvas))
  (with-slots (base-stack base dimension) canvas
    (setf base-stack nil
          base (ecase dimension
                 (2 (list (point 0 0) (vect 1 0) (vect 0 1)))
                 (3 (list (point 0 0 0) (vect 1 0 0) (vect 0 1 0) (vect 0 0 1)))))))

(defmethod key-press ((canvas opengl-canvas) char)
  (declare (ignore char))
  (invalidate canvas))

(defmethod mouse-press-primary ((canvas opengl-canvas) point)
  (declare (ignore point))
  (invalidate canvas))

(defmethod mouse-press-secondary ((canvas opengl-canvas) point)
  (declare (ignore point))
  (invalidate canvas))

(defmethod vertex-transformation ((canvas opengl-canvas) vertex)
  (base-vertex-transformation vertex))

(defmacro display-opengl-canvas (canvas-class)
  (with-unique-names (opengl-interface)
    `(progn
       (capi:define-interface ,opengl-interface ()
         ()
         (:panes (canvas ,canvas-class
                         :configuration (list :rgba t :depth-buffer 16)
                         :display-callback (lambda  (canvas &rest args)
                                             (declare (ignore args))
                                             (let ((*inside-opengl-block* t)
                                                   (*canvas* canvas))
                                               (render-on (canvas)
						(invalidate canvas)
                                                 (funcall #'display canvas))))
                           :resize-callback 'resize-canvas
                           :input-model `(((:button-1 :press) ,(lambda (canvas x y)
                                                                 (let ((*canvas* canvas))
                                                                   (funcall #'mouse-press-primary canvas (point x (- (canvas-height) y))))))
                                          ((:button-3 :press) ,(lambda (canvas x y)
                                                                 (let ((*canvas* canvas))
                                                                   (funcall #'mouse-press-secondary canvas (point x (- (canvas-height) y))))))
                                          (:character ,(lambda (canvas x y char)
                                                         (declare (ignore x y))
                                                         (let ((*canvas* canvas))
                                                           (funcall #'key-press canvas char)))))
                           :min-width 800
                           :min-height 600))
           (:default-initargs :title "OpenGL interface"))
       (handler-case
           (slot-value (display-opengl-interface ',opengl-interface) 'canvas)
         (error () nil)))))
 
(defmacro define-opengl-canvas (name modules variables &rest functions)
   (let ((variables-names (mapcar (lambda (variable) (if (listp variable) (first variable)
                                                  variable)) variables)))
      `(progn
         (defclass ,name ,(or modules '(opengl-canvas))
           ,(mapcar (lambda (variable) 
                       (if (listp variable)
                           `(,(first variable) :initform ,(second variable))
                         `(,variable :initform nil)))
                     variables))
         ,@(mapcar (lambda (function)
                     (let ((function-name (first function))
                           (function-arguments (second function))
                           (function-body (rest (rest function))))
                       (unless (member function-name '(display key-press mouse-press-primary mouse-press-secondary vertex-transformation))
                         (error "Function name ~A is not valid." function-name))
                       (with-unique-names (canvas)
                         `(defmethod ,function-name
                                     ((,canvas ,name)  ,@function-arguments)
                              (with-slots (,@variables-names) ,canvas
                                (declare (ignorable ,@variables-names))
                                ,@(when (eql function-name 'display)
                                    '((call-next-method)))
                                ,@function-body
                                ,@(when (member function-name '(key-press mouse-press-primary mouse-press-secondary))
                                    '((call-next-method))))))))
                     functions))))
 
(defmacro opengl-canvas (modules variables &rest functions)
  (with-unique-names (opengl-canvas)
    `(progn
       (define-opengl-canvas ,opengl-canvas 
                             ,modules
                             ,variables
                             ,@functions)
       (display-opengl-canvas ,opengl-canvas))))

(defmacro opengl (&body body)
  `(opengl-canvas () ()
                  (display ()
                   ,@body)))


(defmethod invalidate ((canvas opengl:opengl-pane))
  (capi:apply-in-pane-process canvas #'gp:invalidate-rectangle canvas))
          

(defun color (point)
  (unless *inside-opengl-block*
    (error "The function color must be called inside opengl macros."))
  (unless (= (dimension point) 3)
    (error "The point has to have dimension three."))
  (unless (every (lambda (c) (<= 0 c 1)) (coordinates point))
    (error "Each coordinate of the point must be between 0 and 1."))
  (opengl:gl-color3-d (coerce (x point) 'double-float)
                      (coerce (y point) 'double-float)
                      (coerce (z point) 'double-float)))

(defun color-point (color)
  (apply #'point (rest (map 'list #'identity (color:get-color-spec color)))))
     

(defvar *inside-polygon-block* nil)

(defmacro polygon (&body body)
  `(progn
     (unless *inside-opengl-block*
       (error "Macro polygon must be used inside opengl macros."))
     (opengl:gl-begin opengl:*gl-polygon*)
     (let ((*inside-polygon-block* t))
       ,@body)
     (opengl:gl-end)))

(defmethod vertex ((vertex point))
  (unless *inside-polygon-block*
    (error "The function must be called inside macro polygon."))
  (let ((dim (dimension vertex)))
    (unless (= dim (slot-value *canvas* 'dimension))
      (error "The point must have dimension ~A." (slot-value *canvas* 'dimension)))
    (apply 
     (if (= dim 2)
         #'opengl:gl-vertex2-d
       #'opengl:gl-vertex3-d)
     (mapcar (lambda (c)
               (coerce c 'double-float))
             (coordinates (funcall #'vertex-transformation *canvas* vertex))))))

(defun get-color ()
  (let ((vect (opengl:make-gl-vector :float 4)))
    (opengl:gl-get-floatv opengl:*gl-current-color* vect)
    (point (opengl:gl-vector-aref vect 0)
           (opengl:gl-vector-aref vect 1)
           (opengl:gl-vector-aref vect 2))))


(defmethod base-vertex-transformation ((point point))
  (unless *inside-opengl-block*
    (error "The function must be called in display callback of opengl macro."))
  (with-slots (base) *canvas*
    (plus (first base)
        (reduce #'plus (mapcar #'mult (coordinates point)
                               (rest base))))))
               

(defmethod c-s-translate ((vector vect))
  (unless *inside-opengl-block*
    (error "The function must be called in display callback of opengl macro."))
  (when *inside-polygon-block*
    (error "The function can not be called inside polygon macro."))
  (with-slots (base) *canvas*
    (setf (first base) (plus (first base) 
                             (reduce #'plus (mapcar #'mult 
                                                    (coordinates vector)
                                                    (rest base)))))))


(defun c-s-rotate (angle &optional (rotation-vector (vect 0 0 1)))
  (unless *inside-opengl-block*
    (error "The function must be called in display callback of opengl macro."))
  (when *inside-polygon-block*
    (error "The function can not be called inside polygon macro."))
  (with-slots (base) *canvas*
    (setf (rest base)
        (mapcar (lambda (v)
                  (rotate v angle rotation-vector))
                (rest base)))))

(defun c-s-scale (&rest coefs)
  (with-slots (base dimension) *canvas*
    (when (= (length coefs) 1)
      (setf coefs (make-list dimension :initial-element (first coefs))))
    (unless *inside-opengl-block*
      (error "The function must be called in display callback of opengl macro."))
    (when *inside-polygon-block*
      (error "The function can not be called inside polygon macro."))
    (unless (= dimension (length coefs))
      (error "The function expects ~A coefs or only one coef for uniform scale." dimension))
    (setf (rest base) (mapcar #'mult coefs (rest base)))))

(defun base-push ()
  (with-slots (base base-stack) *canvas*
    (push (copy-list base) base-stack)))

(defun base-pop ()
  (with-slots (base base-stack) *canvas*
    (setf base (pop base-stack))))

(defmacro with-c-s-pushed (&body body)
  `(progn
  (unless *inside-opengl-block*
    (error "Macro with-c-s-pushed must be used in display callback of opengl macro."))
  (when *inside-polygon-block*
    (error "Macro with-c-s-pushed can not be used inside polygon macro."))
     (base-push)
     (unwind-protect 
         (progn
           ,@body)
       (base-pop))))

(define-opengl-canvas 3d ()
  ((dimension 3)
   (step 32)
   (x-angle 0)
   (y-angle 0)
   (z-angle 0))
  (display ()
   (c-s-translate (vect (/ (canvas-width) 2) (/ (canvas-height) 2)))
   (c-s-rotate x-angle (vect 1 0 0))
   (c-s-rotate y-angle (vect 0 1 0))
   (c-s-rotate z-angle (vect 0 0 1)))
  (key-press (char)
   (case char
     (#\a (incf y-angle (/ pi step)))
     (#\d (decf y-angle (/ pi step)))
     (#\r (incf z-angle (/ pi step)))
     (#\f (decf z-angle (/ pi step)))
     (#\w (incf x-angle (/ pi step)))
     (#\s (decf x-angle (/ pi step))))))
     




