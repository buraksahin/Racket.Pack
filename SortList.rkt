;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname qq-sort) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp")))))
;; quick-sort : (listof number)  ->  (listof number)
;; to create a list of numbers with the same numbers as
;; alon sorted in ascending order
;; assume that the numbers are all distinct 
(define (quick-sort alon)
  (cond
    [(empty? alon) empty]
    [else (append (quick-sort (smaller-items alon (first alon))) 
	    	  (list (first alon)) 
		  (quick-sort (larger-items alon (first alon))))]))

;; larger-items : (listof number) number  ->  (listof number)
;; to create a list with all those numbers on alon  
;; that are larger than threshold
(define (larger-items alon threshold)
  (cond
    [(empty? alon) empty]
    [else (if (> (first alon) threshold) 
	      (cons (first alon) (larger-items (rest alon) threshold))
	      (larger-items (rest alon) threshold))]))

;; smaller-items : (listof number) number  ->  (listof number)
;; to create a list with all those numbers on alon  
;; that are smaller than threshold
(define (smaller-items alon threshold)
  (cond
    [(empty? alon) empty]
    [else (if (< (first alon) threshold) 
	      (cons (first alon) (smaller-items (rest alon) threshold))
	      (smaller-items (rest alon) threshold))]))
(quick-sort '(3 5 32 1 5))