(def q (atom '()))

(defn push [q e]
  (locking q
    (swap! q conj e)
    (println "produced " e)))

(defn pop [q]
  (locking q
    (let [first (first @q)]
      (swap! q rest)
      (println "consumed " first)
      first)))

(defn push-seq [x c]
  (doseq [y (range c)]
    (push q (list x y))
    (Thread/sleep 10)))

(defn pop-seq []
  (while (> @total_count 0)
    (do
      (if (pop q)
        (swap! total_count dec))
      (Thread/sleep 10))))

(def thread_count 5)
(def thread_repeat 10)
(def total_count (atom (* thread_count thread_repeat)))

(let [out *out*]
  (doseq [c (range thread_count)]
    (future
      (push-seq c thread_repeat))))

(let [out *out*]
  (doseq [c (range 1)]
    (future
      (pop-seq))))
