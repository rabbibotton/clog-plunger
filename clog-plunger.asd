
(asdf/parse-defsystem:defsystem #:clog-plunger
  :description
  "CLOG Plunger"
  :author
  "David Botton"
  :license
  "BSD"
  :version
  "0.0.0"
  :serial
  t
  :entry-point
  "clog-plunger:start-app"
  :depends-on
  (#:clog)
  :components
  ((:file "clog-plunger") (:file "card") (:file "card-body") (:file "images")))
(asdf/parse-defsystem:defsystem #:clog-plunger/tools
  :defsystem-depends-on
  (:clog)
  :depends-on
  (#:clog-plunger #:clog/tools)
  :components
  ((:clog-file "card")))