;;;; CLOG Builder generated code - modify original clog file
(in-package :clog-plunger)
(defclass apanel (clog:clog-panel) ((hello-div :reader hello-div)))
(defun create-apanel
       (clog-obj &key (hidden nil) (class nil) (html-id nil) (auto-place t))
  (let ((panel
         (change-class
          (clog:create-div clog-obj :content
                           "<div id=\"CLOGB38714700541\" style=\"box-sizing: content-box; position: absolute; left: 39px; top: 35px;\" data-clog-name=\"hello-div\">A Panel</div>"
                           :hidden hidden :class class :html-id html-id
                           :auto-place auto-place)
          'apanel)))
    (setf (slot-value panel 'hello-div)
            (attach-as-child clog-obj "CLOGB38714700541" :clog-type
             'clog:clog-div :new-id t))
    panel))
