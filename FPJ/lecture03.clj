(defn fib [n]
  (loop [n n
         a 0N
         b 1N]
       (if (< n 1) a
           (recur (- n 1) b (+ a b)))))

(fib 30)


(defn rpn-calc [expr]
  (loop [stack '()
         expr expr]
    (if (empty? expr) (first stack)
      (if (number? (first expr))
        (recur (cons (first expr) stack)
               (rest expr))
        (recur (cons (apply (eval (first expr))
                            (list (first stack) (second stack)))
                     (rest (rest stack)))
               (rest expr))))))


(rpn-calc '(10 20 30 + *))
(rpn-calc '(10 20 + 30 *))
