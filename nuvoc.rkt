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

(define (dump-jdoc-urls)
  (when (file-exists? "data/jdoc")
    (delete-file "data/jdoc"))
  (with-output-to-file "data/jdoc"
    (lambda ()
      (pre-post-order
       (parse nuvoc)
       `((a . ,(lambda (a h . x)
                 (let ((href (first ((sxpath '(// *text*)) h))))
                   (unless (string-contains? href "#")
                     (display (string-append jsoftware.com href))
                     (newline)))
                 a))
         (*text* . ,(lambda x x))
         (*default* . ,(lambda x x))))
      (void))))
