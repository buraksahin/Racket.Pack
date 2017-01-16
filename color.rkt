;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname color) (read-case-sensitive #t) (teachpacks ((lib "universe.ss" "teachpack" "2htdp") (lib "image.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.ss" "teachpack" "2htdp") (lib "image.ss" "teachpack" "htdp")))))
;data definition
(define R 150) ; radius value
(define W (* 2 R))
(define H (* 2 R))
(define ES (empty-scene W H))

;//on-draw function 
;//on-draw:string->string
;//Produce the image and show
;//if "red" -> (circle R .. "red") : draw a red circle.
(check-expect (render "red") (place-image (circle R "solid" "red") R R ES ))


(define (render color-of-ball)
  (cond
    [(string=? color-of-ball "red")
     (place-image (circle R "solid" "red") R R ES )
     ]
    (else (place-image (circle R "solid" color-of-ball) R R ES))
    )
  )


;big-bang animation
;(on-draw render) : produce the image
(define (animation color-of-ball)
  (big-bang color-of-ball 
   (on-draw render)
   )
  )
(animation "green")
