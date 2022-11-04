(in-package :clog-plunger)

; Methods

(defmethod make-draggable ((card index-card))
  (jquery-execute card (format nil "draggable({stack:'#~A div'})"
                          (html-id (parent-element card)))))

(defmethod make-resizable ((card index-card))
  (setf (positioning card) :absolute)
  (jquery-execute (card-frame card) "resizable({autoHide:true})"))

(defmethod make-selectable ((card index-card))
  (setf (selectablep card) t))

(defmethod make-deletable ((card index-card))
  (setf (hiddenp (card-del card)) nil))

(defmethod get-card-data ((card index-card))
  `(:card-id ,(card-id card)
    :title   ,(text-value (card-title card))
    :body    ,(text-value (card-body card))))

(defmethod set-card-data ((card index-card) data &key (replace-card-id t))
  (when replace-card-id
    (setf (card-id card) (getf data :card-id)))
  (setf (text-value (card-title card)) (getf data :title))
  (setf (text-value (card-body card)) (getf data :body)))


; Events

(defun on-delete-card (panel)
  (setf (hiddenp panel) t))
  
(defun on-click-card (panel target)
  (when (selectablep panel)
    (setf (slot-value panel 'selectedp)
      (unless (selectedp panel) t))
    (toggle-class target "w3-border-red")))