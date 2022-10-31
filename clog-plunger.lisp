(defpackage #:clog-plunger
  (:use #:cl #:clog #:clog-gui)
  (:export start-app))

(in-package :clog-plunger)

(defun on-click-card (card)
  (toggle-class card "w3-border-red"))

(defun on-file-new (obj)
  (let* ((app (connection-data-item obj "app-data"))
         (win (create-gui-window obj :title "New Window")))
    (declare (ignore app))
    (setf (display (window-content win)) :flex)
    (setf (flex-wrap (window-content win)) :wrap)
    (setf (justify-content (window-content win)) :space-around)
    (dotimes (n 30)
      (let ((card (create-index-card (window-content win) :class "w3-margin w3-border")))
        (set-on-click card #'on-click-card)
        (setf (text (card-title card)) (format nil "Card - ~A" n))))))

(defun on-file-free (obj)
  (let* ((app (connection-data-item obj "app-data"))
         (win (create-gui-window obj :title "New Window")))
    (declare (ignore app))
    (let ((card (create-index-card (window-content win))))
      (jquery-execute card "draggable()"))))

(defun on-help-about (obj)
  (let* ((about (create-gui-window obj
                                   :title   "About"
                                   :content "<div class='w3-black'>
                                         <center><img src='/img/clogwicon.png'></center>
                                         <center>clog-plunger</center>
                                         <center>clog-plunger</center></div>
                                         <div><p><center>A New App</center>
                                         <center>(c) 2022 - Some One</center></p></div>"
                                   :hidden  t
                                   :width   200
                                   :height  200)))
    (window-center about)
    (setf (visiblep about) t)
    (set-on-window-can-size about (lambda (obj)
                                    (declare (ignore obj))()))))

(defclass app-data ()
  ((data
    :accessor data)))

(defun on-new-window (body)
  (let ((app (make-instance 'app-data)))
    (setf (connection-data-item body "app-data") app)
    (setf (title (html-document body)) "New App")
    (clog-gui-initialize body)
    (add-class body "w3-teal")
    (let* ((menu-bar    (create-gui-menu-bar body))
           (icon-item   (create-gui-menu-icon menu-bar :on-click 'on-help-about))
           (file-item   (create-gui-menu-drop-down menu-bar :content "File"))
           (file-new    (create-gui-menu-item file-item :content "New Window" :on-click 'on-file-new))
           (file-free   (create-gui-menu-item file-item :content "New Free Win" :on-click 'on-file-free))
           (help-item   (create-gui-menu-drop-down menu-bar :content "Help"))
           (help-about  (create-gui-menu-item help-item :content "About" :on-click 'on-help-about))
           (full-screen (create-gui-menu-full-screen menu-bar)))
      (declare (ignore icon-item file-new file-free help-about full-screen)))))

(defun start-app ()
  (initialize 'on-new-window
   :static-root (merge-pathnames "./www/"
                  (asdf:system-source-directory :clog-plunger)))
  (open-browser))
