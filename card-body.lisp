(in-package :clog-plunger)

(defmethod make-draggable ((card index-card))
  (jquery-execute card "draggable()"))

(defmethod make-resizable ((card index-card))
  (setf (positioning card) :absolute)
  (jquery-execute (card-frame card) "resizable()"))

(defmethod make-selectable ((card index-card))
  (setf (selectablep card) t))

(defun on-click-card (panel target)
  (when (selectablep panel)
    (setf (slot-value panel 'selectedp)
      (unless (selectedp panel) t))
    (toggle-class target "w3-border-red")))