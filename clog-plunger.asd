(asdf:defsystem #:clog-plunger
  :description "New CLOG System"
  :author "some@one.com"
  :license  "BSD"
  :version "0.0.0"
  :serial t
  :entry-point "clog-plunger:start-app"  
  :depends-on (#:clog) ; add clog plugins here as #:plugin for run time
  :components ((:file "clog-plunger")
               (:file "apanel")))

(asdf:defsystem #:clog-plunger/tools
  :defsystem-depends-on (:clog)
  :depends-on (#:clog-plunger #:clog/tools) ; add clog plugins here as #:plugin/tools for design time
  :components ((:clog-file "apanel")))
