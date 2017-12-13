(defn rnd-seq [limit]
  "vraci sekvenic nahodnych cisel"
  (lazy-seq (cons (rnd limit)
                  (rnd-seq limit))))

(defn fib-seq
  ([] (fib-seq 0 1))
  ([a b]
   (lazy-seq (cons (+ a b)
                  (fib-seq b (+ a b))))))

(take 10 (fib-seq))



(defn rpn-calc [expr env]
  (loop [stack '()
         expr expr]
    (if (empty? expr) (first stack)
      (if (number? (first expr))
          (recur (cons (first expr) stack)
                 (rest expr))
          (if (contains? env (keyword (first expr)))
              (recur (cons (get env (keyword (first expr)))
                           stack)
                     (rest expr))
              (recur (cons (apply (eval (first expr))
                                  (list (first stack) (second stack)))
                           (rest (rest stack)))
                     (rest expr)))))))


(def myenv {:a 10 :b 20})

(contains? myenv (keyword "a"))


(rpn-calc '(10 20 30 + *) nil)
(rpn-calc '(10 20 + 30 *) nil)
(rpn-calc '("a" 20 30 + *) myenv)
(rpn-calc '("a" "b" 30 + *) myenv)
(rpn-calc '("a" "b" "c" + *) myenv)

(load-file "/home/kamil/Dropbox/UPOL/MGR/FPJ/countries.clj")
;; největší země
(apply max-key (fn [x] (get x :surfacearea)) countries)
;; rozloha kontinentů
(map
  (fn [x] [(x 0) (apply + (map :surfacearea (x 1)))])
  (group-by :continent countries))
;; nejvíce obyvatel
(apply max-key (fn [x] (get x :population)) countries)
;; počet obyvatel na kontinentu
(map
  (fn [x] [(x 0) (apply + (map :population (x 1)))])
  (group-by :continent countries))
