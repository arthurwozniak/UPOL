(ns final.core)

; left to right moves
(defn l-r [size win-size lines]
  (apply concat
         (map (fn [i]
                (loop [row (nth lines i)
                       leader (first row)
                       data '()]

                  (let [row-first (first row)]
                    (if (and (<= (mod row-first size)
                                 (- win-size 1))

                             (<=  (+ row-first (* (- win-size 1) (+ size 1)))
                                  (min (- (+ leader (* win-size size)) 1)
                                       (- (* size size) 1)))); poslední buňka, do které lze táhnout

                      (recur (rest row) leader (cons (map (fn [x] (+ row-first
                                                                     (* x (+ size 1))))
                                                          (range win-size)) data))
                      data))))
              (range (count lines)))))

(defn r-l [size win-size lines]
  (apply concat
         (map (fn [i]
                (loop [row (nth lines i)
                       leader (first row)
                       data '()]

                  (let [row-first (first row)]
                    (if (and (>= (quot row-first size)
                                 (- win-size 1))

                             (<=  (- row-first (* (- win-size 1) (- size 1)))
                                  (max (- (- leader (* (- win-size 2) size)) 1)
                                       (- size 1)))); poslední buňka, do které lze táhnout

                      (recur (rest row) leader (cons (map (fn [x] (- row-first
                                                                     (* x (- size 1))))
                                                          (range win-size)) data))
                      data))))
              (reverse (range (count lines))))))

(defn rows [size win-size lines]
  (filter (fn [x]
            (<= (mod (first x) size)
                (- size win-size)))
          (apply concat
                 (map (fn [y]
                        (map (fn [i] (map (fn [j] (+ j i)) (range win-size)))
                             y)) lines))))

(defn cols [size win-size lines]
  (map (fn [y]
         (map (fn [x]
                (+ y (* x size)))
              (range win-size)))
       (apply concat
              (filter (fn [x]
                        (< (quot (first x) size)
                           (- size (- win-size 1)))) lines))))

(defn exp [x n]
  (reduce * (repeat n x)))

(defprotocol AbstractBoard
  (set-size [board size win-size])
  (size [board])
  (valid-move? [board pos])
  (make-move [board pos])
  (winner? [board player])
  (reset [board])
  (optimal-move [board player])
  (generate-moves [board]))

(defrecord Board [size win-size])

(extend-protocol AbstractBoard
  final.core.Board

  (set-size [this size win-size]
    (reset (assoc this :size size
                  :win-size win-size)))

  (generate-moves [this]
    (let [size (:size this)
          lines (partition size
                           (range (* size size)))
          win-size (:win-size this)]
      (concat
       (cols size win-size lines) ;; možné tahy ve sloupcích
       (rows size win-size lines) ;; možné tahy v řádcích
       (r-l size win-size lines) ;; diagonální tahy zprava doleva
       (l-r size win-size lines) ;; diagonální tahy zleva doprava
)))

  (reset [this]
    (assoc this
           :possible-moves (generate-moves this)
           :current-player (rand-int 2)
           :board (map (fn [x] nil) (range (exp (:size this) 2)))))

  (valid-move? [this pos]
    (and (>= pos 0)
         (< pos (exp (:size this) 2))
         (nil? (nth (:board this) pos))))

  (make-move [this pos]
    (if (valid-move? this pos)
      (let [new-board (assoc this
                             :board
                             (let [board (:board this)]
                               (concat (take pos board)
                                       (list (:current-player this))
                                       (nthnext board (inc pos)))))]

        (assoc new-board

               :winner (if (winner? new-board (:current-player this)) (:current-player new-board))
               :current-player
               (mod (inc (:current-player new-board)) 2)))
      this))

  (winner? [this player]
    (println "Checking win for player" player)
    (println "board")
    (println (:board this))
    (println (map (fn [moves]
                    (map (fn [pos]
                           (nth (:board this) pos))
                         moves))
                  (:possible-moves this)))

    (println "===")

    (some true?
          (map (fn [ev-moves]
                 (every? (fn [box] (= box player)) ev-moves))
               (map (fn [moves]
                      (map (fn [pos]
                             (nth (:board this) pos))
                           moves))
                    (:possible-moves this)))))

  (optimal-move [this player]
    (let [other-player (mod (int player) 2)
          work-board
          (map (fn [moves]
                 (map (fn [pos]
                        (list pos (nth (:board this) pos)))
                      moves))
               (:possible-moves this))
          filtered (filter (fn [moves]
                             (not (some (fn [pair] (= (second pair) other-player)) moves)))
                           work-board)
          reversed
          (reverse (sort-by first
                            (map
                             (fn [moves]
                               (conj moves (apply + (or (filter (fn [x] (not (nil? x))) (map second moves)) '(0)))))

                             filtered)))
          opt-move
          (filter (fn [x] (nil? (second x))) (rest (first reversed)))]

      (first (nth opt-move (rand-int (count opt-move)))))))

(def brd (->Board 3 3))
;(:board (reset brd))
;(winner? (make-move (make-move (assoc (reset brd) :board '(nil nil nil nil nil nil 1 1 1)) 0) 2))
(:moves (set-size brd 100 3))

(defn -main
  "I don't do a whole lot ... yet."
  [& args])

(-main)
