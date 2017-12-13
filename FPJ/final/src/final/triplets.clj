(ns final.triplets
  (:import (javafx.scene SceneBuilder)
           (javafx.scene.control ButtonBuilder)
           (javafx.scene.control RadioButtonBuilder)
           (javafx.scene.control ToggleGroup)
           (javafx.scene.control Slider)
           (javafx.scene.control Label)
           (javafx.scene.layout VBoxBuilder)
           (javafx.scene.layout VBox)
           (javafx.scene.layout GridPane)
           (javafx.scene.layout HBoxBuilder)
           (javafx.geometry Insets)
           (javafx.stage StageBuilder))
  (:require [final.core :as fc]))

(defonce force-toolkit-init (javafx.embed.swing.JFXPanel.))

(def tgl (ToggleGroup.))
(def pvp-id 1)
(def pvc-id 2)
(def board-size 4)
(def win-size 2)
(def pvp-lbls '("Player 1" "Player 2"))
(def pvc-lbls '("Human" "Computer"))
(def current-player (Label. "*current-player*"))

(def board (atom (fc/reset (fc/->Board board-size win-size))))
(def game-type (atom pvp-id))

(defn translate-val [val]
  (if (= 1 val) "X" "O"))

(defn set-player-lbl [lbl-obj]
  (.setText lbl-obj (if (= @game-type pvp-id)
                      (nth pvp-lbls (:current-player @board))
                      (nth pvc-lbls (:current-player @board)))))

(defn redraw-btns [btns gameboard]
  (doseq [[pos child] (map list gameboard btns)]
    (if (not (nil? pos))
      (do
        (.setDisable child true)
        (.setText child (translate-val pos))))))

(defn check-and-play-computer [btns]
  (if (and
       (= pvc-id @game-type)
       (= 1 (:current-player @board)))
    (do
      (set-player-lbl current-player)

      (swap! board
             fc/make-move
             (fc/optimal-move @board (mod (inc (:current-player @board)) 2)))
      (if (:winner @board)
        (doseq [child btns]
          (.setDisable child true)))
      (redraw-btns btns (:board @board))
      (set-player-lbl current-player))))

(defn run-later*
  [f]
  (javafx.application.Platform/runLater f))

(defmacro run-later
  [& body]
  `(run-later* (fn [] ~@body)))

(defn run-now*
  [f]
  (let [result (promise)]
    (run-later
     (deliver result (try (f) (catch Throwable e e))))
    @result))

(defmacro run-now
  [& body]
  `(run-now* (fn [] ~@body)))

(defn event-handler*
  [f]
  (reify javafx.event.EventHandler
    (handle [this e] (f e))))

(defmacro event-handler [arg & body]
  `(event-handler* (fn ~arg ~@body)))

(defn create-button [title width function & args]
  (.. ButtonBuilder create
      (text title)
      (minWidth width)
      (focusTraversable false)
      (onAction (event-handler [_] (apply function (conj args (.getSource _)))))
      build))

(defn create-radio-button [title id group is-selected]
  (.. RadioButtonBuilder create
      (text title)
      (toggleGroup group)
      (id (str id))
      (selected is-selected)
      (onAction (event-handler [_]
                               (println "Toggled " id)))
      build))

(defn create-slider [min max val step]
  (let [slider (Slider.)]
    (.setMin slider min)
    (.setMax slider max)
    (.setValue slider val)
    (.setBlockIncrement slider 1)
    (.setShowTickLabels slider true)
    (.setShowTickMarks slider true)
    (.setMinorTickCount slider 1)
    (.setMajorTickUnit slider 1)
    slider))

(def slider (create-slider 3 10 board-size 1))
(def win-slider (create-slider 2 10 win-size 1))

(defn fill-board [grid size]
  (let [btns (map (fn [x]
                    (create-button "" 40
                                   (fn [btn y]
                        ;(println btn)
                                     ;(.setDisable btn true)
                                     ;(.setText btn (str (:current-player @board)))
                                     (swap! board fc/make-move x)
                                     ;(println (:board @board))
                                     ;(println (map (fn [move] (map  (fn [x] (nth (:board @board) x)) move)) (:possible-moves @board)))
                                     ;(println (fc/winner? @board nil))
                        ;(println y)
                                     (if (:winner @board)
                                       (doseq [child (.getChildren (.getParent btn))]
                                         (.setDisable child true)))
                                     ; překresli tlačítka
                                     (redraw-btns (.getChildren (.getParent btn)) (:board @board))

                                     (check-and-play-computer (.getChildren (.getParent btn)))
                                     (set-player-lbl current-player)

                                     (println @board)) x))
                  (range 0 (* size size)))]
    (println "size: " size)
    (set-player-lbl current-player)
    (doseq [i (range (count btns))]

      (.add grid (nth btns i) (rem i size) (quot i size)))
    grid))

(def board-ui
  (let
   [grid (GridPane.)]
    (.setHgap grid 10)
    (.setVgap grid 10)
    (fill-board grid (.getValue slider))))

(def control-box
  (.. VBoxBuilder create
      (spacing 10)
      (children [(create-radio-button "PVP" pvp-id tgl true)
                 (create-radio-button "PVC" pvc-id tgl false)
                 (Label. "Board size")
                 slider
                 (Label. "Winner size")
                 win-slider
                 (create-button "New Game" 0 (fn [btn]
                                               (let [board-size (int (Math/round (.getValue slider)))
                                                     win-size (int (Math/round (.getValue win-slider)))]
                                                 (.clear (.getChildren board-ui))
                                                 (println "board-size" board-size)
                                                 (println "win-size" win-size)
                                                 (println "toggle " (.getId (.getSelectedToggle tgl)))
                                                 (reset! game-type (Integer. (.getId (.getSelectedToggle tgl))))
                                                 (if (> win-size board-size)
                                                   (.setValue win-slider board-size)
                                                   (.setValue win-slider win-size))
                                                 (.setValue slider board-size)
                                                 (swap! board fc/set-size board-size win-size)
                                                 (fill-board board-ui board-size)
                                                 (set-player-lbl current-player)
                                                 (check-and-play-computer (.getChildren board-ui)))))

                 (.. HBoxBuilder create (spacing 5) (children [(Label. "Current player: ") current-player]) build)])
      build))

(def stage (atom nil))
;; You of course don't have to write it all in one block. Using a (def button (.. ButtonBuilder ...)) and then adding button is just as good (probably better most of the times).
(run-now (reset! stage (.. StageBuilder create
                           (title "Ultimate Triplet Arena")
                           (scene (.. SceneBuilder create
                                      (height 480) (width 640)
                                      (root (.. HBoxBuilder create
                                                (minHeight 480) (minWidth 640)
                                                (padding (Insets. 10))
                                                (spacing 10)
                                                (children [control-box
                                                           board-ui])
                                                build))
                                      build))
                           build)))

(defn -main
  [& args]
  (run-now (.showAndWait @stage)))

;(-main)
