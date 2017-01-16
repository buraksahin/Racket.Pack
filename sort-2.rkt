;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname sort-2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define (reduce base combine l)
  (cond
    [(empty? l) base]
    [else (combine (first l)
	    (reduce base combine (rest l)))])) 


(define (tab l)
  (local ((define (insert an alon)
	    (cond
	      [(empty? alon) (list an)]
	      [else (cond
		      [(> an (first alon)) (cons an alon)]
		      [else (cons (first alon) (insert an (rest alon)))])])))
    (reduce empty insert l))) 


(tab '(2 3 1))
