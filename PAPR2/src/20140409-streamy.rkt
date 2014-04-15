;;; reseni z minula
;; naprogramujte multifor

(define proc-or
  (lambda args
    (if (null? args) #f
        (if (car args) #t
            (apply proc-or (cdr args))))))

;(proc-or)
;(proc-or #f #f 1)

;; navodna - jednodussi uloha

(define-syntax for
  (syntax-rules (in do)
      ((for vars in lists do stmt1 ...)
       (let loop ((l lists))
         (if (not (apply proc-or (map null? l)))
             (begin
               (apply (lambda vars
                        stmt1 ...)
                      (map car l))
               (loop (map cdr l))))))))

   
;(for (a b) in '((1 2) (3 4)) do (display a) (newline) (display b) (newline))

;; varianta 1

(define-syntax multifor
  (syntax-rules (in do)
    ((multifor ((var in value ...) ...) do statement ...)
       (for (var ...) in '((value ...) ...) do statement ...))))


;(multifor ((a in 1 2) (b in 3 4)) do (display a) (newline) (display b) (newline))

;; varianta 2 (bez pomocneho globalniho makra)

(define-syntax multifor
  (syntax-rules (in do)
    ((multifor ((var in value ...) ...) do statement ...)
     (let-syntax ((m-for (syntax-rules (in do)
                           ((m-for vars in lists do stmt)
                            (let loop ((l lists))
                              (if (not (apply proc-or (map null? l)))
                                  (begin
                                    (apply (lambda vars
                                             stmt)
                                           (map car l))
                                    (loop (map cdr l)))))))))
       (m-for (var ...) in '((value ...) ...) do (begin statement ...))))))


;(multifor ((a in 1 2 10) (b in 3 4 5)) do (display (+ a b)) (newline))

;;; nove - streamy
;; delay a force by sly nahradit takto. Jediny rozdil je v tom, ze ted prislib neni typu promise...

;(define-macro delay
;  (lambda exprs
;    `(let ((result (lambda ()
;                     (begin ,@exprs)))
;           (evaluated? #f))
;       (lambda ()
;         (begin
;           (if (not evaluated?)
;               (begin
;                 (set! evaluated? #t)
;                 (set! result (result))))
;           result)))))
;
;(define force
;  (lambda (promise)
;    (promise)))


(define-macro cons-stream
  (lambda (a b)
    `(cons ,a (delay ,b))))

(define stream-car car)

(define stream-cdr
  (lambda (stream)
    (force (cdr stream))))

(define test (cons-stream (+ 1 2) (cons-stream (begin (display "ted") (+ 3 4)) ())))
;test
(stream-cdr test)

(define stream-null? null?)

(stream-null? (stream-cdr test))
(stream-null? (stream-cdr (stream-cdr test)))

(define stream?
  (lambda (elem)
    (or (null? elem)
        (and (pair? elem)
             (and (promise? (cdr elem))
                  (stream? (force (cdr elem))))))))

(stream? test)
(stream? test)

;; lepsi varianta, ktera nevyhodnocuje prisliby
(define stream?
  (lambda (elem)
    (or (null? elem)
        (and (pair? elem)
             (or (promise? (cdr elem))
                 (null? (cdr elem)))))))

(stream? test)

;; Uloha - doprogramujte:
;(define display-stream (lambda (stream . n) ...

(define display-stream 
  (lambda (s . n)
    (if (not (stream-null? s))
        (if (null? n)
            (begin
              (display (stream-car s))
              (newline)
              (display-stream (stream-cdr s)))
            (if (> (car n) 0)
                (begin
                  (display (stream-car s))
                  (newline)
                  (display-stream (stream-cdr s) (- (car n) 1))))))))


(display-stream test)

(define stream-length
  (lambda (stream)
    (if (stream-null? stream)
        0
        (+ 1 (stream-length (stream-cdr stream))))))

(stream-length test)

(define stream-map
  (lambda (f . streams)
    (if (stream-null? (car streams))
        '()
        (cons-stream
         (apply f (map stream-car streams))
         (apply stream-map f
                (map stream-cdr streams))))))

(stream-map - test)
(stream-cdr (stream-map - test))

(define list->stream
  (lambda (list)
    (foldr (lambda (x y)
             (cons-stream x y))
           '() list)))

(define stream
  (lambda args
    (list->stream args)))

(define test2 (stream 1 (begin (display "ted2") 2) 3 4))
test2

(display-stream (stream 1 2 3 4 5 6 7 8 9) 5)

(define stream-foldr
  (lambda (f nil . streams)
    (if (stream-null? (car streams))
        nil
        (apply f
               `(,@(map stream-car streams)
                 ,(delay
                    (apply stream-foldr f nil
                           (map stream-cdr streams))))))))

(stream-foldr (lambda (x y) (cons-stream (- x) (force y))) '() (stream 1 2 3 'blah 4))

(define stream->list
  (lambda (stream)
    (stream-foldr (lambda (x y)
                    (cons x (force y)))
                  '()
                  stream)))

(define stream-filter
  (lambda (prop? stream)
    (stream-foldr (lambda (x y)
                    (if (prop? x)
                        (cons-stream x (force y))
                        (force y)))
                  '()
                  stream)))

(stream->list (stream-filter (lambda (x) (< x 3)) (stream 1 2 3 2 0 1 2)))

;;; Priklady nekonecnych proudu

;;jednicky
; rekurzivní procedura bez limitní podmínky
(define ones-proc
  (lambda ()
    (cons-stream 1 (ones-proc))))

; nekonecný proud vytvorený voláním ones-proc
(define ones (ones-proc))

; predchozí s použitím pojmenovaného let
(define ones (let proc ()
               (cons-stream 1 (proc))))
; implicitní definice proudu
(define ones (cons-stream 1 ones))

;(display-stream ones 15)

;;prirozena cisla
; rekurzivní procedura bez limitní podmínky
(define naturals-proc
  (lambda (i)
    (cons-stream i (naturals-proc (+ i 1)))))
; nekonecný proud vytvorený voláním naturals-proc
(define naturals (naturals-proc 1))
; predchozí s použitím pojmenovaného let
(define naturals (let iter ((i 1))
                   (cons-stream i (iter (+ i 1)))))
; implicitní definice proudu
(define naturals (cons-stream 1
                              (stream-map + ones naturals)))

;(display-stream naturals 15)

;;druhe mocniny

; pojmenovanym let
(define pow2
  (let next ((last 1))
    (cons-stream last
                 (next (* 2 last )))))
; implicitní definice
(define pow2
  (cons-stream 1
               (stream-map (lambda (x) (* 2 x))
                           pow2)))

;(display-stream pow2 15)

;; Uloha - vytvorte efektivne (Er. sito) stream prvocisel

(define eratosthenes
  (lambda (stream)
    (if (stream-null? stream)
        '()
        (cons-stream (car stream)
                     (eratosthenes
                      (stream-filter (lambda (x)
                                       (not (= 0 (modulo x (car stream)))))
                                     (stream-cdr stream)))))))
    

(display-stream (eratosthenes (stream 2 3 4 5 6 7 8 9 10 11 12 13)))
(eratosthenes (cons-stream 2 (cons-stream (begin (display "ted") 3) (cons-stream 4 ()))))
(stream->list (eratosthenes (cons-stream 2 (cons-stream (begin (display "ted") 3) (cons-stream 4 ()))))) 

(define primes 
  (eratosthenes (stream-cdr naturals)))

(display-stream primes 20)










;; Uloha - sliti streamu


  
;(display-stream (merge-streams (stream 1 2 3 4 5) (stream -2 -4 -5 -6) (stream 12 34)))

