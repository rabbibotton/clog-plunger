;;;; CLOG Builder generated code - modify original clog file
(in-package :clog-plunger)
(defclass card-board (clog:clog-panel)
          ((board-frame :reader board-frame)
           (card-hash :accessor card-hash :initform
            (make-hash-table* :test #'equalp))))
(defun create-card-board
       (clog-obj &key (hidden nil) (class nil) (html-id nil) (auto-place t))
  (let ((panel
         (change-class
          (clog:create-div clog-obj :content
                           "<div style=\"box-sizing: content-box; position: absolute; inset: 0px; background-image: none;\" id=\"CLOGB3876928377\" data-clog-name=\"board-frame\"></div>"
                           :hidden hidden :class class :html-id html-id
                           :auto-place auto-place)
          'card-board)))
    (setf (slot-value panel 'board-frame)
            (attach-as-child clog-obj "CLOGB3876928377" :clog-type
             'clog:clog-div :new-id t))
    (let ((target (board-frame panel)))
      (declare (ignorable target))
      (setf (background-image target)
              (cl-ppcre:regex-replace-all "\\x0A" cork-image ""))
      (setf (background-repeat target) :repeat)
      (setf (background-attachment target) :local))
    panel))