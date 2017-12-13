(defvar *computer* 10) 
(defvar *computer2* 3)
(defvar *opponent* 1) 
(defvar *test-board* nil)

(defvar *triplets* 
  '((1 2 3) (4 5 6) (7 8 9) ;Horizontalne
    (1 4 7) (2 5 8) (3 6 9) ;Vertikale
    (1 5 9) (3 5 7)) ;Diagonalne
  "pozice na hraci desce, kde muze dojit k zaplneni rady a tedy k vitezstvi jednoho z hracu")

#|
(setf *test-board* (make-board))
(make-move *computer* 3 *test-board*)
(make-move *opponent* 0 *test-board*)
|#

(defun make-board ()
  (mapcar #'(lambda (x) 
              (and x) ; fakin unbound warning
              (mapcar #'(lambda (x) 
                          (- x x)) ; fakin unbound warning
                      (car *triplets*))) 
          (car *triplets*)))

(defun convert-to-letter (v) 
  "prevadi reprezentaci desky na znaky pro tisk desky"
  (cond ((eql v 1) 
         "O") 
        ((eql v 10) 
         "X")
        ((eql v 3)
         "O")
        (t " ")))

#|
(convert-to-letter 1)
(convert-to-letter 10)
|#

(defun print-row (x y z) 
  "tiskne jeden radek hraci desky"
  (format t "|~a|~a|~a|~%" 
          (convert-to-letter x)
          (convert-to-letter y)
          (convert-to-letter z)
  )
  )
 

#|
(print-row 1 1 10)
|#

(defun print-row-separator ()
  (format t "-------~%"))

(print-row-separator)

(defun print-board (id l1 l2 l3) 
  "vytiskne hraci desku"
  (unless (equal id 'board) (error "not a board"))
  (print-row-separator)
  (apply #'print-row l1)
  (print-row-separator)
  (apply #'print-row l2)
  (print-row-separator)
  (apply #'print-row l3)
  (print-row-separator)
  )
  
#|
(print-board 'board 1 0 0 0 10 0 0 0 10)
|#

(defun make-move (player position board) 
  (let ((position (- position 1)))
  "nastavi kamen player na pozici pos, vrati hraci desku"
  (setf (nth (mod position 3) (nth (/ (- position (mod position 3)) 3) board)) player)
  board
  ))

(defun pick-up-value (board pos)
  (nth (mod (- pos 1) 3) 
       (nth (/ (- (- pos 1) (mod (- pos 1) 3)) 3)
            board)))

(pick-up-value *test-board* 2)

(defun sum-triplet (board triplet)
  "secte hodnoty na pozicich danych seznamem triplet v hraci desce"
  (apply #'+ (mapcar #'(lambda (pos)
                         (pick-up-value board pos)) triplet)))
  
#|
(sum-triplet *test-board* '(3 5 7))
|#

(defun compute-sums (board)
  "spocita sum-triplets pro celou hraci desku"
  (mapcar #'(lambda (triplet) 
              (sum-triplet board triplet)) *triplets*)) 

#|
(compute-sums *test-board*)
|#

(defun winner-p (board player)
  "nil pokud NEdoslo k vitezstvi"
  (let ((sums (compute-sums board)))
    (member (* 3 player) sums)))

(defun board-full-p (board) 
  "je cela hraci deska zaplnena ?"
  (if (member 0 (apply #'append board))
      NIL
    T))
  
(defun position-occupied-p (position board)
  "je dana pozice obsazena hracim kamenem?"
  (if (= 0 (pick-up-value board position))
      NIL
    T))
    
(defun read-a-legal-move (board) 
  (format t "Your move: ") 
  (let ((pos (read))) 
    (cond ((or (> pos 9) (< pos 1))
           (format t "Invalid  input.~%") 
           (read-a-legal-move board)) 
          ((position-occupied-p pos board)
           (format t "That space is already occupied.~%") 
           (read-a-legal-move board)) 
          (t pos)))) 


(defun empty-pos-list (board)
  (mapcar #'(lambda (x)
              (if (position-occupied-p x board)
                  nil
                x)) '(1 2 3 4 5 6 7 8 9)))

(defun pick-random-empty-position (board)
  "nahodne vybere nekterou z volnych pozic na hraci desce" 
  (let ((list (remove NIL (empty-pos-list board))))
    (nth (random (list-length list)) list)))

(defun random-move-strategy (board) 
  "vrati seznam (volna-pozice \"random move\")"
  (list (pick-random-empty-position board) "random move")) 

(defun my-best-move (board value)
  (let* ((available (empty-pos-list board))
         (sums (compute-sums board))
         (pairs (mapcar #'(lambda (x y) ; vytvoří seznam dvojic, na které jsou volné pro tah (suma na tripletu . triplet)
                            (if (= x 0) ; 0 => všechny pozice jsou volné
                                (cons x (cons y nil))
                              (if (= (mod x value) 0) ; na daném tripletu jsou pouze tahy daného hráče
                                  (cons x (cons y nil))
                                NIL)))                            
                        sums
                        *triplets*)))
    (setf pairs (remove nil pairs)) ; odstraní nily a namapovaných dvojic
    (setf pairs (sort pairs #'> :key #'car)) ; seřadí seznam vzestupně
    (setf pairs (remove-if-not #'(lambda (x) (eql (car x) (caar pairs))) pairs)) ; nechá pouze největší hodnoty
    (setf pairs (nth (random (list-length pairs)) pairs)) ; vybere náhodný triplet
    (car (remove nil
                 (mapcar #'(lambda (x)
                             (if (position-occupied-p x board)
                                 NIL
                               x))
                         (cadr pairs)))))) ; najde volnou pozici a vrátí ji jako výsledek
    
    


(defun choose-best-move (board)
  "vybere nejlepsi tah"
  (random-move-strategy board)) 

(defun computer-move (board game-type *player*) 
  "tah pocitace"
  (let* ((best-move (choose-best-move board)) 
         (best-move-pos (first best-move)) 
         (best-move-strategy (second best-move)) 
         (new-board (make-move *player* (my-best-move board *player*) board))) 
    (format t "My move: ~S~%" best-move-pos) 
    (format t "My strategy: ~A~%" best-move-strategy) 
    (apply #'print-board 'board new-board) 
    (cond ((winner-p new-board *player*)
           (format t "Computer ~a win!~%" *player* ))
          ((board-full-p new-board)
           (format t "Tie game.~%"))
          ((eql game-type 'computer-game)
           (if (eql *player* 10)
               (computer-move new-board 'computer-game *computer2*)
             (computer-move new-board 'computer-game *computer*)))
          (t (opponent-move new-board)))))

(defun opponent-move (board) 
  "tah hrace"
  (let* ((pos (read-a-legal-move board)) 
         (new-board (make-move *opponent* pos board)))
    (apply #'print-board 'board new-board) 
    (cond ((winner-p new-board *opponent*)
           (format t "You win!~%"))
          ((board-full-p new-board)
           (format t "Tie game.~%")) 
          (t (computer-move new-board 'opponent-game *computer*))))) 

(defun computer-game ()
  (computer-move (make-board) 'computer-game *computer*))

(defun play-one-game () 
  (if (y-or-n-p "Would you like to go first? ") 
      (opponent-move (make-board)) 
    (computer-move (make-board) 'opponent-game *computer*))) 

#|
(computer-game)
|#

;kompletni kod nesmi pri kompilaci hlasit zadne warningy
