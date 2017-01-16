;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname week16-cs) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
(define-struct Node (Name Neighbors))
; Name is String
; Neighbors is list of Strings

; A Graph is list of Nodes
; - empty
; - (cons Node Graph)
(define AGraph
  (list
   (make-Node "A" (list "B" "C" "F"))
   (make-Node "B" (list "C" "D"))
   (make-Node "C" (list "E"))
   (make-Node "E" empty)
   (make-Node "D" (list "F"))
   (make-Node "F" empty)))

; Graph String String --> (list of String)/false

(check-expect (find-path AGraph "F" "E") false)
(check-expect (find-path AGraph "A" "E") (list "A" "C" "E"))

(define (find-path G  org dest)
  (cond
    [(string=? org dest) (list dest)]
    [(empty? (neighbors G org)) false]
    [else
     (local(
            (define answer
              (find-path-from-neighbors G (neighbors G org) dest)))   
       (if (boolean? answer)
           false
           (cons org answer)))]))

; Graph (list of String) String --> (list of String)/false
; finds the shortest possible route.
(define (find-path-from-neighbors G lorgs dest)
  (cond
    [(empty? lorgs) false]
    [else
     (local (
             (define answer (find-path G (first lorgs) dest))
             (define rest-answers (find-path-from-neighbors G (rest lorgs) dest)))
       (if 
        (boolean? answer)
        rest-answers
        (shorter answer rest-answers)))]))

; (list of String) (list of String)/false --> list of string
(define (shorter a1 a2)
  (cond
    [(boolean? a2) a1]
    [else
     (if (< (length a1) (length a2)) a1 a2)]))

; (list of Node) String --> (list of String)
(define (neighbors G org)
  (cond
    [(empty? G) empty]
    [else
     (if (string=? org (Node-Name (first G))) 
         (Node-Neighbors (first G))
         (neighbors (rest G) org))]))