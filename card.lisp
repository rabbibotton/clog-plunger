;;;; CLOG Builder generated code - modify original clog file
(in-package :clog-plunger)
(defclass index-card (clog:clog-panel)
          ((card-del :reader card-del) (card-body :reader card-body)
           (card-bar :reader card-bar) (card-title :reader card-title)
           (card-frame :reader card-frame)
           (selectablep :accessor selectablep :initform nil)
           (selectedp :reader selectedp :initform nil)))
(defun create-index-card
       (clog-obj &key (hidden nil) (class nil) (html-id nil) (auto-place t))
  (let ((panel
         (change-class
          (clog:create-div clog-obj :content
                           "<div class=\"w3-border w3-container w3-card-2\" style=\"box-sizing: content-box; position: relative; overflow: auto; width: 261px; height: 161px; left: 0px; top: 0px;\" id=\"CLOGB3876486474\" data-clog-name=\"card-frame\"><div style=\"box-sizing: content-box; position: static;\" id=\"CLOGB3876486475\" data-clog-name=\"card-title\">Title</div><div style=\"box-sizing: content-box; position: static; height: 2px;\" class=\"w3-blue\" id=\"CLOGB3876486476\" data-clog-name=\"card-bar\"></div><div style=\"box-sizing: content-box; position: static;\" id=\"CLOGB3876486477\" data-clog-name=\"card-body\">Body</div><span style=\"box-sizing: content-box; position: absolute; top: 0px; right: 5px;\" class=\"w3-text-red\" id=\"CLOGB3876486478\" data-clog-name=\"card-del\">x</span></div>"
                           :hidden hidden :class class :html-id html-id
                           :auto-place auto-place)
          'index-card)))
    (setf (slot-value panel 'card-del)
            (attach-as-child clog-obj "CLOGB3876486478" :clog-type
             'clog:clog-span :new-id t))
    (setf (slot-value panel 'card-body)
            (attach-as-child clog-obj "CLOGB3876486477" :clog-type
             'clog:clog-div :new-id t))
    (setf (slot-value panel 'card-bar)
            (attach-as-child clog-obj "CLOGB3876486476" :clog-type
             'clog:clog-div :new-id t))
    (setf (slot-value panel 'card-title)
            (attach-as-child clog-obj "CLOGB3876486475" :clog-type
             'clog:clog-div :new-id t))
    (setf (slot-value panel 'card-frame)
            (attach-as-child clog-obj "CLOGB3876486474" :clog-type
             'clog:clog-div :new-id t))
    (let ((target (card-del panel)))
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
    panel))