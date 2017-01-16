;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname recursion) (read-case-sensitive #t) (teachpacks ((lib "universe.ss" "teachpack" "2htdp") (lib "image.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "universe.ss" "teachpack" "2htdp") (lib "image.ss" "teachpack" "htdp")))))
(define (Length a-list)
  (cond
    [(empty? a-list) 0]
    [else (add1 (Length (rest a-list)))]))

