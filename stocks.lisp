

(ql:quickload "cl-csv")
(ql:quickload "drakma")

(setf *yahoo-api-base-url* "http://finance.yahoo.com/d/quotes.csv")
(setf *companies* '("AAPL"
                    "GOOG"
                    "MSFT"))

(setf csv-filepath (make-pathname :directory "/home/sol/" :name "quotes.csv"))
(setf drakma:*header-stream* *standard-output*)

(setf api-url "http://finance.yahoo.com/d/quotes.csv?s=AAPL+GOOG+MSFT&f=nab")

(setf http-response (drakma:http-request api-url))
(with-open-file (f "/home/sol/Downloads/tmp.csv"
                   :direction :output
                   :element-type '(unsigned-byte 8))
  (write-sequence http-response f))


(defun foo (a b)
  (+ a b))

(defun bar ()
  (format t "hello"))
