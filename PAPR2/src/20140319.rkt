(display "if*")(newline)

(define-macro if*
  (lambda (test expr . alt)
    `(let (($result ,test))
      (if $result
          ,expr
          ,@alt))))

(if* 1 2 3)
(if* 1 $result 3)

(display "and")(newline)

(define-macro and
  (lambda args
    (if (null? args)
        #t
        (if (null? (cdr args))
            (car args)
            `(if ,(car args)
                (and ,@(cdr args))
                #f)))))

(and 1 2 3)
(and)

(display "fluid-and")(newline)

(define-macro fluid-and
  (lambda args
    (if (null? args) #t
    `(let (($result ,(car args)))
       (cond ((equal? #f $result) #f)
             (,(null? (cdr args)) $result)
             (else (fluid-and ,@(cdr args))))))))
  
(fluid-and)
(fluid-and 1 #f 3)
(fluid-and 1 (= $result 1) 3 $result)

(display "cond")(newline)

(define-macro cond
  (lambda clist
    (if (null? clist)
        `(if #f #f)
        (if (equal? (caar clist) 'else)
            (cadar clist)
            `(if ,(caar clist)
                 ,(cadar clist)
                 (cond ,@(cdr clist)))))))
(cond ((= 1 1) 1))

(display "cond*")(newline)

(define-macro cond*
  (lambda clist
    (if (null? clist)
        `(if #f #f)
        (if (equal? (caar clist) 'else)
            (cadar clist)
            `(let (($result ,(eval (caar clist))))
                   (if $result
                       ,(cadar clist)
                       (cond* ,@(cdr clist))))))))
  
  
  
(cond* ((> 2 2) 2)
       ((equal? 2 2.) 3)
       (else 5))
  
(cond* ((> 2 2) 2)
       ((+ 2 2) (- 5 $result))
       (else 5))


(display "foreach cyklus")(newline)

(define-macro foreach
  (lambda (symbol list . body)
    (let ((loop-name (gensym)))
      `(let ,loop-name ((l ,list))
        (if (not (null? l))
            (let ((,symbol (car l)))
              ,@body
              (,loop-name (cdr l))))))))

(foreach i '(1 2 3 4 5) (set! i (+ 10 i)) (display i) (newline))

;=> 11 12 13 14 15