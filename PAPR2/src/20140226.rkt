(define p1 0)
(define p2 0)

(define mul
  (lambda args
    (set! p1 (+ 1 p1))
    (let ((out (apply * args)))
      (if (not (= 0 out))
          (set! p2 (+ 1 p2)))
      out)))
 
;(mul 1 2 3 4 0)
;(mul 1 2 3 4)

(define ns
  (let ((* *))
    (lambda args
      (set! p1 (+ 1 p1))
      (let ((out (apply * args)))
        (if (not (= 0 out))
            (set! p2 (+ 1 p2)))
        out))))
;(ns 1 2 3)

(define na2
  (lambda (x)
    (* x x)))

(define expt2
  (lambda (x n)
    (cond ((= n 0) 1)
          ((even? n)
           (na2 (expt2 x (/ n 2))))
          (else (* x (expt2 x (- n 1)))))))

;(expt2 2 30)
;(expt2 2 5)

(define proc
  (let ((stav 100))
    (lambda (x y)
      (let ((out 0))
        (if (> stav 0)
            (begin
              (set! out (* x y))
              (set! stav (- stav out))
              out))))))
;(proc 2 8)

(define localns
  (let ((p1 0)
        (p2 0))
    (lambda args
      (set! p1 (+ 1 p1))
      (let ((out (apply * args)))
        (if (not (= 0 out))
            (set! p2 (+ 1 p2)))
        (list out p1 p2)))))
            
;(localns 2 1)
;p1
;p2

(define nenulove 0)
(define pouzito 0)

(define test
  (let ((pouzito 0))
    `(,(lambda args
         (set! pouzito (+ pouzito 1))
         (let ((out (apply * args)))
           (if (not (= 0 out))
               (set! nenulove (+ nenulove 1)))
           out))
           ,(lambda () pouzito)
           ,(lambda () (set! pouzito 0)))))

;((car test) 1 2 3)
;((cadr test))
;((caddr test))
;((cadr test))

(define test
  (let ((pouzito 0))
    `(,(lambda args
         (set! pouzito (+ pouzito 1))
         (let ((out (apply expt2 args)))
           (if (not (= 0 out))
               (set! nenulove (+ nenulove 1)))
           out))
           ,(lambda () pouzito)
           ,(lambda () (set! pouzito 0)))))

((car test) 2 5)
((car test) 2 5)
;expt2 2 5 => result
((cadr test))
;pocet nasobeni
;nulovani pocitadla
;((car test) )