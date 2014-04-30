(define-syntax switch
  (syntax-rules (case default)
    ((switch value
             (case c1 e1 ...)
             ...)
     (let ((result value))
       (cond ((= value c1) (begin e1 ...))
             ...)))
    ((switch value
             (case c1 e1 ...)
             ...
             (default e ...))
     (let ((result value))
       (cond ((= value c1) (begin e1 ...))
             ...
             (else (begin e ...)))))))
                   
(switch (+ 1 1)
        (case 1 (display "one") (newline))
        (case 2 (display "two") (newline))
        (case 3 (display "three") (newline)))

(switch (+ 1 5)
        (case 1 (display "one") (newline))
        (case 2 (display "two") (newline))
        (case 3 (display "three") (newline))
        (default (display "none") (newline)))
(newline)

(define-syntax for
  (syntax-rules (for)
    
;    ((for ((var1 val1) ...) cond () body ...)
;     (let* ((var1 val1)
;            ...)
;       (let iter ()
;         (if cond
;             (begin
;               body
;               ...
;               (iter))))))
    
    ((for ((var1 val1) ...) cond (expr ...) body ...)
    (let* ((var1 val1)
          ...)
      (let iter ()
        (if cond
            (begin
              body
              ...
              expr
              ...
              (iter))))))
    
    ((for () cond (expr ...) body ...)
     (let iter ()
       (if cond
           (begin
             body
             ...
             expr
             ...
             (iter)))))
    
    ))


(for ((i 0) (j i)) 
  (< i 10) 
  ((set! i (+ i 1)) (set! j (+ j i))) 
  (display j) (newline))

(newline)

(let ((i 5))
  (for () (< i 10) ((set! i (+ i 1))) (display i) (newline)))
(newline)
(for ((i 5)) (> i 0) () (display i) (set! i (- i 2)) (newline))



