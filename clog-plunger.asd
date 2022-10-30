
(asdf/parse-defsystem:defsystem #:clog-plunger
  :description
  "New CLOG System"
  :author
  "some@one.com"
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
  ((:file "clog-plunger") (:file "card")))
(asdf/parse-defsystem:defsystem #:clog-plunger/tools
  :defsystem-depends-on
  (:clog)
  :depends-on
  (#:clog-plunger #:clog/tools)
  :components
  ((:clog-file "card")))