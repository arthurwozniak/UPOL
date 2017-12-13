(in-package "CL-USER")

(defsystem oop ()
  :members ("micro-graphics/load" "expressions" "omg" "omg-examples")
  :rules ((:compile :all 
           (:requires (:load :previous)))))

(compile-system 'oop :load t)