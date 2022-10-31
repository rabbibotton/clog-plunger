(in-package :clog-plunger)

(defmethod make-draggable ((card index-card))
  (jquery-execute card "draggable()"))

(defmethod make-selectable ((card index-card))
  (setf (selectablep card) t))