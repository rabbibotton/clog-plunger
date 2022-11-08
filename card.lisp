;;;; CLOG Builder generated code - modify original clog file
(in-package :clog-plunger)
(defclass index-card (clog:clog-panel)
          ((card-load :reader card-load) (card-save :reader card-save)
           (card-del :reader card-del) (card-body :reader card-body)
           (card-bar :reader card-bar) (card-title :reader card-title)
           (card-frame :reader card-frame)
           (selectablep :accessor selectablep :initform nil)
           (selectedp :reader selectedp :initform nil)
           (card-id :accessor card-id :initform (get-universal-time))))
(defun create-index-card
       (clog-obj &key (hidden nil) (class nil) (html-id nil) (auto-place t))
  (let ((panel
         (change-class
          (clog:create-div clog-obj :content
                           "<div class=\"w3-border w3-container w3-card-2\" style=\"box-sizing: content-box; position: relative; overflow: auto; width: 261px; height: 161px; left: 0px; top: 0px;\" id=\"CLOGB3876915465\" data-clog-name=\"card-frame\"><div style=\"box-sizing: content-box; position: static;\" id=\"CLOGB3876915466\" data-clog-name=\"card-title\">Title</div><div style=\"box-sizing: content-box; position: static; height: 2px;\" class=\"w3-blue\" id=\"CLOGB3876915467\" data-clog-name=\"card-bar\"></div><div style=\"box-sizing: content-box; position: static;\" id=\"CLOGB3876915468\" data-clog-name=\"card-body\">Body</div><span style=\"box-sizing: content-box; position: absolute; top: 0px; right: 5px; width: 10px; height: 22px;\" class=\"w3-text-red\" id=\"CLOGB3876915469\" data-clog-name=\"card-del\">x</span><span style=\"box-sizing: content-box; position: absolute; top: 20px; right: 5px; width: 10px; height: 22px;\" class=\"w3-text-blue\" id=\"CLOGB3876915470\" data-clog-name=\"card-save\">&gt;</span><span style=\"box-sizing: content-box; position: absolute; top: 40px; right: 5px; width: 10px; height: 22px;\" class=\"w3-text-blue\" id=\"CLOGB3876915471\" data-clog-name=\"card-load\">&lt;</span></div>"
                           :hidden hidden :class class :html-id html-id
                           :auto-place auto-place)
          'index-card)))
    (setf (slot-value panel 'card-load)
            (attach-as-child clog-obj "CLOGB3876915471" :clog-type
             'clog:clog-span :new-id t))
    (setf (slot-value panel 'card-save)
            (attach-as-child clog-obj "CLOGB3876915470" :clog-type
             'clog:clog-span :new-id t))
    (setf (slot-value panel 'card-del)
            (attach-as-child clog-obj "CLOGB3876915469" :clog-type
             'clog:clog-span :new-id t))
    (setf (slot-value panel 'card-body)
            (attach-as-child clog-obj "CLOGB3876915468" :clog-type
             'clog:clog-div :new-id t))
    (setf (slot-value panel 'card-bar)
            (attach-as-child clog-obj "CLOGB3876915467" :clog-type
             'clog:clog-div :new-id t))
    (setf (slot-value panel 'card-title)
            (attach-as-child clog-obj "CLOGB3876915466" :clog-type
             'clog:clog-div :new-id t))
    (setf (slot-value panel 'card-frame)
            (attach-as-child clog-obj "CLOGB3876915465" :clog-type
             'clog:clog-div :new-id t))
    (let ((target (card-del panel)))
      (declare (ignorable target))
      (setf (hiddenp target) t))
    (let ((target (card-save panel)))
      (declare (ignorable target))
      (setf (hiddenp target) t))
    (let ((target (card-load panel)))
      (declare (ignorable target))
      (setf (hiddenp target) t))
    (clog:set-on-click (card-frame panel)
                       (lambda (target)
                         (declare (ignorable target))
                         (on-click-card panel target)))
    (clog:set-on-double-click (card-title panel)
                              (lambda (target)
                                (declare (ignorable target))
                                (focus target)))
    (clog:set-on-double-click (card-body panel)
                              (lambda (target)
                                (declare (ignorable target))
                                (focus target)))
    (clog:set-on-click (card-del panel)
                       (lambda (target)
                         (declare (ignorable target))
                         (on-delete-card panel)))
    (clog:set-on-click (card-save panel)
                       (lambda (target)
                         (declare (ignorable target))
                         (on-save-card panel)))
    (clog:set-on-click (card-load panel)
                       (lambda (target)
                         (declare (ignorable target))
                         (on-load-card panel)))
    panel))