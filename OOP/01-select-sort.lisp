;; Vytvoření select sortu (konstruktivní [tvorba nového seznamu] a destruktivní [modifikace aktuálního] varianta
;; přidání dalšího parametru, který upravuje uspořádání (sestupně/vzestupně)


(defvar *my-list*)
(setf *my-list* '(8 2 8 2 0 4 1 18 9 3 12))

(defun select-sort-con (list)
  (if (eql list nil)
      '()
    (let ((min
     ; nalezení nejmenší hodnoty
           (labels (( iter (min tmp-list)
                      (if (eql tmp-list nil)
                          min
                        (if (< (car tmp-list) min)
                            (iter (car tmp-list) (cdr tmp-list))
                          (iter min (cdr tmp-list))))))
             (iter (car list) (cdr list)))))
      (cons min
            (select-sort-con
             ; vytvoření seznamu bez jednoho výskytu dané proměnné
             (labels ((iter (tmp-list)
                        (if (eql (car tmp-list) min)
                            (cdr tmp-list)
                          (cons (car tmp-list)
                                (iter (cdr tmp-list))))))
               (iter list)))))))
 
(select-sort-con *my-list*)

(defun select-sort-con-after-study (list)
  (if (eql list nil)
      nil
    (let ((min (apply (function min) list))) ; nalezení nejmenšího prvku pomocí aplikování aritmetické funkce min na seznam
      (cons min ;vytvoření tečkového páru, první prvek nejmenší v zadaném sezmanu
            ; (remove co odkud :count kolikrát) (count defaultně nil => neomezeno)
            (select-sort-con-after-study (remove min list :count 1))))))

(select-sort-con-after-study *my-list*)

; možnost výběru sestupného/vzestupného seřazení
(defun select-sort-con-comp (list comp-sign)
  (if (eql list nil)
      nil
    (let ((var  (labels (( iter (min tmp-list)
                      (if (eql tmp-list nil)
                          min
                        (if (funcall comp-sign (car tmp-list) min)
                            (iter (car tmp-list) (cdr tmp-list))
                          (iter min (cdr tmp-list))))))
             (iter (car list) (cdr list)))))
      (cons var
            (select-sort-con-comp (remove var list :count 1) comp-sign)))))

(select-sort-con-comp *my-list* #'<)
(select-sort-con-comp *my-list* #'>)




(defun select-sort-con-after-study (list)
  (if (eql list nil)
      nil
    (let ((min (apply (function min) list))) ; nalezení nejmenšího prvku pomocí aplikování aritmetické funkce min na seznam
      (cons min ;vytvoření tečkového páru, první prvek nejmenší v zadaném sezmanu
            ; (remove co odkud :count kolikrát) (count defaultně nil => neomezeno)
            (select-sort-con-after-study (remove min list :count 1))))))

(select-sort-con-after-study *my-list*)

; možnost výběru sestupného/vzestupného seřazení
(defun select-sort-con-comp (list comp-sign)
  (if (eql list nil)
      nil
    (let ((var  (labels (( iter (min tmp-list)
                      (if (eql tmp-list nil)
                          min
                        (if (funcall comp-sign (car tmp-list) min)
                            (iter (car tmp-list) (cdr tmp-list))
                          (iter min (cdr tmp-list))))))
             (iter (car list) (cdr list)))))
      (cons var
            (select-sort-con-comp (remove var list :count 1) comp-sign)))))

(select-sort-con-comp *my-list* #'<)
(select-sort-con-comp *my-list* #'>)



(defun select-sort-con-after-study (list)
  (if (eql list nil)
      nil
    (let ((min (apply (function min) list))) ; nalezení nejmenšího prvku pomocí aplikování aritmetické funkce min na seznam
      (cons min ;vytvoření tečkového páru, první prvek nejmenší v zadaném sezmanu
            ; (remove co odkud :count kolikrát) (count defaultně nil => neomezeno)
            (select-sort-con-after-study (remove min list :count 1))))))

(select-sort-con-after-study *my-list*)

; možnost výběru sestupného/vzestupného seřazení
(defun select-sort-con-comp (list comp-sign)
  (if (eql list nil)
      nil
    (let ((var  (labels (( iter (min tmp-list)
                      (if (eql tmp-list nil)
                          min
                        (if (funcall comp-sign (car tmp-list) min)
                            (iter (car tmp-list) (cdr tmp-list))
                          (iter min (cdr tmp-list))))))
             (iter (car list) (cdr list)))))
      (cons var
            (select-sort-con-comp (remove var list :count 1) comp-sign)))))

(select-sort-con-comp *my-list* #'<)
(select-sort-con-comp *my-list* #'>)


(defun select-sort-destructive (list)
    (labels ((iter (tmp-list)
               (if (eql nil tmp-list)
                   list
                 (let ((min (apply (function min) tmp-list)))
                   (setf (cdr tmp-list) (remove min tmp-list :count 1))
                   (setf (car tmp-list) min)
                   ; (setf tmp-list (cons min (remove min tmp-list :count 1)))
                   (iter (cdr tmp-list))))))
      (iter list)))

(select-sort-destructive *my-list*)
*my-list*