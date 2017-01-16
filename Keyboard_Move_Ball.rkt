;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname balls) (read-case-sensitive #t) (teachpacks ((lib "universe.ss" "teachpack" "2htdp") (lib "image.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "universe.ss" "teachpack" "2htdp") (lib "image.ss" "teachpack" "htdp")))))
;Data Definition
(define WIDTH 200)
(define D 200)
(define e-scene (empty-scene 200 200))
(define ES (place-image (rectangle 200 200 "solid" "black") 100 100 e-scene))
(define ball (circle 10 'solid 'red))


;mousef world number number mouseenet -> world
;key-f world keyevent ->world
(define (keyf world ke)
  (cond [(and (<= -88 world ) (key=? ke "up") )
         (-  world 2)]
        [(and (<= world 88)(key=? ke "down") )
         (+  world 2)]
        [else world]
        ))

(define (draw-f world)
(place-image (text (number->string world) 10 "white") 90 (+ 90 (+ world 2 )) 
(place-image ball (+ 100  world) (+ 100 world) 
(place-image ball (- 100  world) (- 100 world)
(place-image ball (- 100  world) (+ 100 world)
(place-image ball (+ 100  world) (- 100 world) ES))))))


(big-bang 0         
          (on-draw draw-f)   
          (on-key keyf)
             )

