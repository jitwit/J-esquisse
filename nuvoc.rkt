#lang racket

(require html-parsing
         sxml/sxpath
         sxml
         webscraperhelper)

(define jsoftware.com "https://code.jsoftware.com")

(define nuvoc
  (with-input-from-file "data/Nuvoc"
    (lambda ()
      (html->xexp (current-input-port)))))

(define parse
  (compose (sxpath '(// td (*or* tt a)))
           third
           (sxpath '(// table))))

(define jdoc
  (pre-post-order
   (parse nuvoc)
   `((a . ,(lambda (a h . x) ;; gross way to delete title attribute
             `(a (@ (href ,(string-append
                            jsoftware.com
                            (first ((sxpath '(// *text*)) h)))))
                 ,@x)))
     (*text* . ,(lambda x x))
     (*default* . ,(lambda x x)))))


(define (dump-jdoc-urls)
  (delete-file "data/jdoc")
  (with-output-to-file "data/jdoc"
    (lambda ()
      (pre-post-order
       (parse nuvoc)
       `((a . ,(lambda (a h . x)
                 (display (string-append
                           jsoftware.com
                           (first ((sxpath '(// *text*)) h))))
                 (newline)
                 a))
         (*text* . ,(lambda x x))
         (*default* . ,(lambda x x))))
      (void))))
