;;;; CLOG Builder generated code - modify original clog file
(in-package :clog-plunger)
(defclass index-card (clog:clog-panel)
          ((card-body :reader card-body) (card-bar :reader card-bar)
           (card-title :reader card-title) (card-frame :reader card-frame)))
(defun create-index-card
       (clog-obj &key (hidden nil) (class nil) (html-id nil) (auto-place t))
  (let ((panel
         (change-class
          (clog:create-div clog-obj :content
                           "<div class=\"w3-container w3-card-2\" style=\"width: 261px; height: 161px; box-sizing: content-box; position: static; overflow: auto;\" id=\"CLOGB3875959715\" data-clog-name=\"card-frame\"><div style=\"box-sizing: content-box; position: static;\" id=\"CLOGB3875959716\" data-clog-name=\"card-title\">Title</div><div style=\"box-sizing: content-box; position: static; height: 2px;\" class=\"w3-blue\" id=\"CLOGB3875959717\" data-clog-name=\"card-bar\"></div><div style=\"box-sizing: content-box; position: static;\" id=\"CLOGB3875959718\" data-clog-name=\"card-body\">Body</div></div>"
                           :hidden hidden :class class :html-id html-id
                           :auto-place auto-place)
          'index-card)))
    (setf (slot-value panel 'card-body)
            (attach-as-child clog-obj "CLOGB3875959718" :clog-type
             'clog:clog-div :new-id t))
    (setf (slot-value panel 'card-bar)
            (attach-as-child clog-obj "CLOGB3875959717" :clog-type
             'clog:clog-div :new-id t))
    (setf (slot-value panel 'card-title)
            (attach-as-child clog-obj "CLOGB3875959716" :clog-type
             'clog:clog-div :new-id t))
    (setf (slot-value panel 'card-frame)
            (attach-as-child clog-obj "CLOGB3875959715" :clog-type
             'clog:clog-div :new-id t))
    panel))