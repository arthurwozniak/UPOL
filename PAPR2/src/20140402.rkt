; ===== for cyklus =====


(display "for cyklus")(newline)

(define-syntax for
  (syntax-rules (:= to downto do step)
    ((for var := start to end do stmt ...)
     (let loop ((var start))
       (if (<= var end)
           (begin
             stmt ...
             (loop (+ var 1))))))
    ((for var := start downto end do stmt ...)
     (let loop ((var start))
       (if (>= var end)
           (begin 
             stmt ...
             (loop (- var 1))))))
    ((for var := start to end step inc do stmt ...)
     (let loop ((var start))
       (if (<= var end)
           (begin
             stmt ...
             (loop (+ var inc))))))
    ((for var := start downto end step dec do stmt ...)
     (let loop ((var start))
       (if (>= var end)
           (begin
             stmt ...
             (loop (- var dex))))))))
    
(for i := 10 downto 5 do (display i) (newline))


; ===== foreach cyklus =====


(display "foreach") (newline)

(define-syntax foreach
  (syntax-rules (in do)
    ((foreach var in list do stmt ...)
     (let loop ((l list))
       (if (not (null? l))
           (let ((var (car l)))
             stmt ...
             (loop (cdr l))))))))

(foreach cislo in '(1 4 5 7) do (display cislo) (newline))


; ===== myfor cyklus =====


(display "myfor")(newline)

(define-syntax myfor
  (syntax-rules (:= to modified by do)
    ((myfor var := start to end modified by proc do stmt ...)
     (let loop ((var start))
       (if (<= var end)
           (begin
             (fluid-let ((var (proc var)))
               stmt ...)
             (loop (+ 1 var)))))))) 

(myfor xyz := 5 to 10 modified by (lambda (x) (* x x 2))
       do (display xyz) (newline))


; ===== myfor cyklus =====


(display "multifor")(newline)

(define-syntax multifor
  (syntax-rules (list do step)
    ((multifor (list ...) do stmt ...)
     (begin
       (begin
         (set! list (cddr list)) ...)
       (let loop ((first list))
         (if (not (null? first))
             (begin
               (+ 
          
(multifor ((a in 1 2 10)
           (b in 3 4 5))
          do (display (+ a b))
             (newline)) ;=> 4 6 15