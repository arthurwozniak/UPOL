(defun regular-polygon (c radius count)
  (opengl
    (color (color-point :red))
    (polygon
      (let ((my-vector (vect 0 radius))
            (center-vector (vect (x c) (y c))))
        (dotimes (i count)
          (let ((tmp-vector (rotate my-vector (* (+ 1 i) (/ (* 2 pi) count)))))
            (vertex (point (x (plus tmp-vector center-vector))
                           (y (plus tmp-vector center-vector))))))))))


(defun circle (center radius)
  (regular-polygon center radius 
                   (car (multiple-value-list (round (* 2 pi radius))))))

(defun star (center r1 r2 count)
  (opengl
    (color (color-point :green))
    (let ((r1-vec (vect 0 r1))
          (r2-vec (rotate (vect 0 r2) (- (/ pi count))))
          (center-vector (vect (x center) (y center))))
      (dotimes (i count)
        (let ((tmp-vector1 (rotate r1-vec (* i (/ (* 2 pi) count))))
              (tmp-vector2-1 (rotate r2-vec (* i (/ (* 2 pi) count))))
              (tmp-vector2-2 (rotate r2-vec (* (+ i 1) (/ (* 2 pi) count)))))
          (polygon 
            (vertex (point (x (plus tmp-vector1 center-vector))
                           (y (plus tmp-vector1 center-vector))))
            (vertex (point (x (plus tmp-vector2-1 center-vector))
                           (y (plus tmp-vector2-1 center-vector))))
            (vertex (point (x center)
                           (y center)))
            (vertex (point (x (plus tmp-vector2-2 center-vector))
                           (y (plus tmp-vector2-2 center-vector))))))))))
          
      