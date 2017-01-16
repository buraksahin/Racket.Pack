;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname proje123) (read-case-sensitive #t) (teachpacks ((lib "universe.ss" "teachpack" "2htdp") (lib "image.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "universe.ss" "teachpack" "2htdp") (lib "image.ss" "teachpack" "htdp")))))

(define DEPTH 200)
(define WIDTH 200)
(define D 200)
(define empty-s (empty-scene 200 200))
(define ball (circle 10 'solid 'red))

;tick-f world (number)->world' world '(number)
(define (tickf world)
  (add1 world))
(check-expect (tickf 0) 1)

;mousef world number number mouseenet -> world
;key-f world keyevent ->world
(define (keyf world ke)
  (if (key=? ke "home")
      0
      world))

(define (drawf world)
  (place-image ball 50 (/ world 2)  empty-s))

;  Define a mouse function
; 'button-down for old version
(define (mouse-f w x y me)
  (if (mouse=? me "button-down")
      y
      w))
(define (end? w) (> w D))

  (big-bang 0
   
            (on-tick tickf)
            (on-mouse mouse-f)
            (on-draw drawf)
            (on-key keyf)
            (stop-when end?)
            )

