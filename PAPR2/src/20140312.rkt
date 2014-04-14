(define make-dlist
  (let ((dlist '()))
    (lambda (signal . expr)
      
      (define cons-dlist
        (lambda (elem)
          (let ((new-cell (mcons elem
                                 (mcons '()
                                        dlist))))
            (if (not (null? dlist))
                (set-mcar! (mcdr dlist) new-cell))
            new-cell)))
      
      (define dlist-car (lambda (dlist) (mcar dlist)))
      (define dlist-cdr (lambda (dlist) (mcdr (mcdr dlist))))
      (define dlist-cir (lambda (dlist) (mcar (mcdr dlist))))
      
      (define dlist-print
        (lambda ()
          (display "<")
          (let iter ((l dlist))
            (if (null? l) '()
                (begin 
                  (display (dlist-car l))
                  (if (not (null? (dlist-cdr l))) (display ", "))
                  (iter (dlist-cdr l)))))
          (display ">")
          (newline)))
      
      (define dlist-insert
        (lambda (index element)
          (cond ((= index 0)
                 (set! dlist (cons-dlist element)))
                (else
                 (let iter ((i (- index 1))
                            (node dlist))
                   (cond ((and (> index 0) (null? dlist))
                          (display "ERROR: dlist is too small to insert element on position ")(display index)(newline)) 
                         
                         ((= 0 i)
                          (let ((new-node (mcons
                                           element
                                           (mcons node (dlist-cdr node)))))
                            (begin
                              (set-mcar! (mcdr (dlist-cdr node))
                                         new-node)
                              (set-mcdr! (mcdr node)
                                         new-node))))
                         ((null? (dlist-cdr node))
                          (let ((new-node (mcons
                                           element
                                           (mcons node '()))))
                            (set-mcdr! (mcdr node)
                                       new-node)))
                         (else (iter (- i 1) (dlist-cdr node)))))))))
      
      (define dlist-remove
        (lambda (index)
          (cond ((null? (mcar dlist))
                 (display "ERROR: dlist is empty")(newline))
                ((= index 0)
                 (set! dlist (dlist-cdr dlist))
                 (if (not (null? dlist))
                     (set-mcar! (mcdr dlist) '())))
                (else
                 (let iter ((i (- index 1))
                            (node dlist))
                   (cond ((null? (dlist-cdr node))
                          (display "Error: Out of range")
                          (newline))
                         ((= 0 i)
                          (begin
                            (if (null? (dlist-cdr (dlist-cdr node)))
                                (set-mcdr! (mcdr node) '())
                                (begin
                                  (set-mcdr! (mcdr node)
                                             (dlist-cdr (dlist-cdr node)))
                                  (set-mcar! (mcdr (dlist-cdr node))
                                             node)))))
                         (else (iter (- i 1) (dlist-cdr node)))))))))
      
      (cond ((eq? signal 'dcdr)
             (dlist-cdr dlist))
            ((eq? signal 'print)
             (dlist-print))
            ((eq? signal 'insert)
             (dlist-insert (car expr) (cadr expr)))
            ((eq? signal 'remove)
             (dlist-remove (car expr)))
            ((eq? signal 'raw)
             dlist)
            (else (display "ERROR: unknown command")(newline)))
      )))

(define s make-dlist)
(s 'insert 0 'a)
(s 'print)
(s 'insert 0 'c)
(s 'print)
(s 'insert 1 'b)
(s 'print)
(s 'insert 4 'e)
(s 'print)
(s 'raw)
(s 'remove 2)
(s 'print)
(s 'remove 4)
(s 'print)
