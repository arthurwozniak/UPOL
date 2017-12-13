(ns upol.lecture05)

(defrecord EyeMatrix [size])

(extend-protocol Matrix
  upol.lecture05.EyeMatrix
  (lookup [this i j]
    (if (= i j)
      (* 1 (:coef this 1))
      0))

  (dims [this] [(:size this) (:size this)])

  (*-scalar [this k]
    (assoc this :coef k)))

(def a (->EyeMatrix 10))

(lookup a 1 1)
(lookup (*-scalar a 10) 1 1)

(defprotocol Switchable
  (turnOn [x])
  (turnOff [x])
  (isOn? [x]))

(defrecord CheapLight [])

(defrecord Light [])

(extend-protocol Switchable
  upol.lecture05.CheapLight
  (turnOn [this]
    (assoc this :state true))

  (turnOff [this]
    (if (:state this false)
      (do
        (assoc this :count (+ 1 (:count this 0))
               :state (not (< (+ 1 (:count this 0)) 10))))))

  (isOn? [this]
    (:state this false)))

(extend-protocol Switchable
  upol.lecture05.Light
  (turnOn [this]
    (assoc this :state true))

  (turnOff [this]
    (if (:state this false)

      (assoc this :state false)))

  (isOn? [this]
    (:state this false)))

(defn isDefective? [light]

  (loop [n 20
         light light]
    (if (< n 1) (isOn? light)
        (recur (- n 1) (turnOff (turnOn light))))))

(def cheap (->CheapLight))
(def light (->Light))
(isDefective? cheap)
(isDefective? light)
