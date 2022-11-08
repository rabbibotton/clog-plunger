(in-package :clog-plunger)

(defun make-new-card (panel)
  (let ((card (create-index-card (board-frame panel))))
    (setf (background-color card) :white)
    (setf (editablep (card-title card)) t)
    (setf (editablep (card-body card)) t)
    (make-saveable card)
    (make-loadable card)
    (make-deletable card)
    (make-resizable card)
    (make-draggable card)
    (setf (gethash (card-id card) (card-hash panel)) card)
    card))
    
(defun save-board (panel)
  (server-file-dialog panel "Safe Board.." ""
    (lambda (result)
      (with-open-file (f result :direction :output :if-exists :supersede)
        (let (out)
          (maphash
            (lambda (k v)
              (declare (ignore k))
              (push (get-card-data v) out))
            (card-hash panel))
          (write out :stream f))))))

(defun load-board (panel)
  (server-file-dialog panel "Load Board.." ""
    (lambda (result)
      (with-open-file (f result :direction :input)
        (let ((cards (read f)))
          (dolist (c cards)
            (set-card-data (make-new-card panel) c :replace-card-id nil)))))))
  
(defun delete-board (panel)
  (maphash (lambda (k v)
             (declare (ignore k))
             (destroy v))
             (card-hash panel))
  (clrhash (card-hash panel)))
  )

  