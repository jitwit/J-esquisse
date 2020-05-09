#lang racket

(require html-parsing
         sxml/sxpath
         sxml
         webscraperhelper)

(define jsoftware.com "https://code.jsoftware.com")
(define data/Nuvoc "data/Nuvoc")
(define data/jdoc "data/jdoc")

(define nuvoc
  (with-input-from-file data/Nuvoc
    (lambda ()
      (html->xexp (current-input-port)))))

;; key is border-right:none! the things following one of those which
;; don't have that property are part of monad/dyad info

(define parse
  (compose (sxpath '(// td))
           (node-pos 3)
           (sxpath '(// table))))

(define (jdoc-entity? node) ;; doesn't catch end of row?
  (match (assoc 'style (sxml:attr-list node))
    (`(style ,css) (and (string-contains? css "border-right:none")
                        (not (string-contains? css "border-left:none"))))
    (_ #f)))

(define (group nodes)
  (let loop ((nodes nodes) (xs '()) (xss '()))
    (match nodes
      ('() (reverse xss))
      (`(,x ,nodes ...)
       (if (jdoc-entity? x)
         (loop nodes (list x) (cons (cons '*jdoc* (reverse xs)) xss))
         (loop nodes (cons x xs) xss))))))

(define parse* (compose group parse))

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



