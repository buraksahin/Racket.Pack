;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname mouse-event) (read-case-sensitive #t) (teachpacks ((lib "universe.ss" "teachpack" "2htdp") (lib "image.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.ss" "teachpack" "2htdp") (lib "image.ss" "teachpack" "htdp")))))
(define OBJ (circle 10 'outline "blue"))
(define W 100)
(define D 400)
(define MT (empty-scene W D))

;World is
; - number
; - it tells posn of OBJ
(define W0 0)

;render: World -> Scene
(define (render w)
  (place-image OBJ (* 1/2 W) w MT)
  )

;mouse-f: World Integer Integer MouseEvent -> World
(define (mouse-f w x y me)
  (cond
    [(mouse=? me "button-down") y]
    [else w]
    ))

;update: World -> World
(define (update w) (+ 2 w))

(big-bang 
 W0
 (on-draw render)
 (on-mouse mouse-f)
 (on-tick update)
 )