;;
;; VARS
;; identita vs. stav
;;
(def john {:name "John Doe" :age 20 :status :single})
(def john (update john :age inc))


;;
;; ATOMY -- synchronni (blokujici), nekoordinovane
;;

;; referenci hodnota
(def a (atom 10))

;; ziskani hodnoty
(deref a)

;; atomicka aktualizace (compare-and-swap)
(swap! a inc)
(deref a)

(swap! a + 20)
(deref a)

(def john (atom {:name "John Doe" :age 20 :status :single}))
(swap! john update :age inc)
(swap! john assoc :status :married)
(deref john)

;; je mozne pridat watch (varianta observeru)
(add-watch a
           :a-watch-name
           (fn [key ref old new] (println old "->" new)))

;; je mozne pridat validator
(def b (atom 1 :validator pos?))
(swap! b inc)
(swap! b dec)
;; (swap! b dec)


;;
;; TRANSAKCNI PAMET -- synchronni (blokujici), nekoordinovane
;;

(def monk     (ref {:health 100 :strength 40  :items []}))
(def warrior  (ref {:health 80  :strength 140 :items []}))
(def dead-elf (ref {:health 0   :strength 20  :items (range 0 20)}))

(defn loot [from to]
  (dosync ;; zahaji transakci
    (when (not-empty (:items @from))
      (let [item (first (:items @from))]
        (alter to   update :items conj item)
        (alter from update :items rest)))))

(let [f1 (future (while (not-empty (:items @dead-elf)) (loot dead-elf monk)))
      f2 (future (while (not-empty (:items @dead-elf)) (loot dead-elf warrior)))]
  (deref f1)
  (deref f2))

(deref monk)
(deref warrior)
(deref dead-elf)

;;
;; AGENTI -- asynchronni (neblokujici), nekoordinovane
;; bezpecne pouziti s IO
;;

(def ag (agent 10))
(deref ag)

(send ag inc) ;; neblokuje, samostatny pool vlaken
(deref ag)

(send-off ag inc) ;; neblokuje, pool vlaken pro I/O + futures
(deref ag)

;;
;; Tradicni zamykani (odpovidajici synchronized)
;;

(def my-list (java.util.ArrayList.))
(locking my-list
  (.add my-list 42)
  (.toString my-list))
