(define na2
  (lambda (x)
    (* x x)))

(((lambda (x y)
    (lambda (y z)
      (+ (x (na2 y)) (na2 z))))
  ((lambda (f g)
     (lambda (x)
       (f (f (g x)))))
   (lambda (x)
     (+ 2 x))
   na2)
  2)
 5
 (na2 2))

(define funkce
  (lambda (f n . args)
    (let iter ((list args)
               (num n)
               (out '()))
      (if (null? list) out
          (iter (cdr list) (- num 1)
                (cons (cons (f (car list))
                            num)
                      out)
                )))))

(funkce na2 6 1 2 3 4 5 6 7)
      
               