(defprotocol Switchable
  (turnOn [x])
  (turnOff [x])
  (isOn? [x]))

(def switchable-impl
  {:turnOn (fn [this] (assoc this :state true))
   :isOn? (fn [this] (:state this false))})

(defrecord CheapLight [])

(defrecord Light [])

(extend CheapLight Switchable
        (assoc switchable-impl
               :turnOff
               (fn [this]
                 (if (:state this false)
                   (do
                     (assoc this :count (+ 1 (:count this 0))
                            :state (not (< (+ 1 (:count this 0)) 10))))))))

(extend Light Switchable
        (assoc switchable-impl
               :turnOff (fn [this]
                          (if (:state this false)

                            (assoc this :state false)))))

(defn isDefective? [light]

  (loop [n 20
         light light]
    (if (< n 1) (isOn? light)
        (recur (- n 1) (turnOff (turnOn light))))))

(def cheap (->CheapLight))
(def light (->Light))
(isDefective? cheap)
(isDefective? light)

(defmulti inf
  (fn [a b]
    (cond (number? a) :number
          (set? a) :set
          (symbol? a) :symbol)))

(defmethod inf :number [a b]
  (min a b))

(defmethod inf :set [a b]
  (clojure.set/intersection a b))

(defmethod inf :symbol [a b]
  (cond (and (= a 'a) (or (= b 'b) (= b 'c) (= b 'd))) a
        (and (= a 'b) (= b 'd)) a
        (and (= a 'c) (= b 'd)) a
        (or (and (= a 'b) (= b 'c))
            (and (= a 'c) (= b 'b))) nil
        (= a b) nil
        :else b))

(inf 4 3)
(inf (set '[2 3 4 5 6]) (set '[1 2 3]))
(inf 'c 'd)
(inf 'b 'd)
(inf 'b 'c)
(ns-unmap *ns* 'inf)

(defn pmin [xs]
  (if (> (count xs) 1)
    (let [divided (split-at (quot (count xs) 2) xs)
          f_half (future (pmin (first divided)))
          s_half (future (pmin (second divided)))]
      (if (< @f_half @s_half) @f_half @s_half))
    (first xs)))

(pmin [8 6 8 1 0 2])
