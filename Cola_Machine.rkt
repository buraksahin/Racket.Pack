;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname kola) (read-case-sensitive #t) (teachpacks ((lib "universe.ss" "teachpack" "2htdp") (lib "image.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "universe.ss" "teachpack" "2htdp") (lib "image.ss" "teachpack" "htdp")))))
;Data Definition
; machine 
; s: Current state of your machine
; cr: Total credits available
; pw:  Price of a bottle of water
; nw: Number of water bottles available
; pc: Price of a can of coke
; nc: Number of cans of coke
(define-struct machine (s cr pw nw pc nc))
; machineS: serving machine 
; machineL: loading machine
(define machineS (rectangle 800 200 'solid 'yellow))
(define machineL (rectangle 800 200 'solid 'blue))
(define machine_sceneL (place-image machineL 400 100 (empty-scene 800 200))) 
(define machine_sceneS (place-image machineS 400 100 (empty-scene 800 200)))
; info: the text on the machine
(define (info m)
  (string-append " Credits : " (number->string (machine-cr m))
                 " Water count : " (number->string (machine-nw m))
                 " Coke count : " (number->string (machine-nc m))
                 "                                              "
                 " Coke price : " (number->string (machine-pc m))
                 " Water price : "(number->string (machine-pw m))) )

;Purpose: Draw the machine
;Contract: string -> scene
;Template:
;(define (draw_v_machine m)
;  (cond ( (string=? (machine-s m) "serving") ...)
;        (else ...))) 
  
(define (draw_v_machine m)
  (cond ( (string=? (machine-s m) "serving") (place-image (text (info m) 12 'red)
                                                          100 
                                                          100 
                                                          machine_sceneS))
        (else (place-image (text  (info m) 12 'red)
                           100 
                           100 
                           machine_sceneL))) 
  )

;Purpose: designing our functions
;Template: 
;(define (serving-action cre prw numw  prc numc ke)
;  (cond ((string=? ke "1") ...)
;        ((string=? ke "5") ...)
;        ((string=? ke "c") (if (and (>= cre prc) (> numc 0))
;                               (...)
;                               (...))
;        ((string=? ke "w") (if (and (>= cre prw) (> numw 0))
;                               (...)
;                               (...)))
;        
;        ((string=? ke "insert") (...))
;        (else (make-machine "serving" cre prw numw  prc numc))))


(define (serving-action cre prw numw  prc numc ke)
  (cond ((string=? ke "1") (make-machine "serving" (+ 1 cre) prw numw  prc numc ))
        ((string=? ke "5") (make-machine "serving" (+ 5 cre) prw numw  prc numc ))
        ((string=? ke "c") (if (and (>= cre prc) (> numc 0))
                               (make-machine "serving" (- cre prc) prw numw  prc (- numc 1))
                               (make-machine "serving" cre prw numw  prc numc)))
        ((string=? ke "w") (if (and (>= cre prw) (> numw 0))
                               (make-machine "serving" (- cre prw) prw (- numw 1) prc  numc )
                               (make-machine "serving" cre prw numw  prc numc)))
        
        ((string=? ke "insert") (make-machine "loading" cre prw numw prc numc ))
        (else (make-machine "serving" cre prw numw  prc numc))))
;Template
;(define (loading-action cre prw numw  prc numc ke)
;  (cond ((string=? ke "w") (...))
;        ((string=? ke "c") (...))
;        ((string=? ke "\r") (...))
;        (else (make-machine "loading" cre prw numw  prc numc))))
;Code: 
(define (loading-action cre prw numw  prc numc ke)
  (cond ((string=? ke "w") (make-machine "loading" cre prw (+ 6 numw)  prc numc ))
        ((string=? ke "c") (make-machine "loading"  cre prw numw  prc (+ 6 numc) ) )
        ((string=? ke "\r") (make-machine "serving" cre prw numw  prc numc ) )
        (else (make-machine "loading" cre prw numw  prc numc))))


(define (action_v_machine m ke)
  (cond 
    ((string=? (machine-s m) "serving") (serving-action (machine-cr m) (machine-pw m) (machine-nw m) (machine-pc m) (machine-nc m) ke))
    ((string=? (machine-s m) "loading") (loading-action (machine-cr m) (machine-pw m) (machine-nw m) (machine-pc m) (machine-nc m) ke))
    (else  m)))



(big-bang (make-machine "serving" 0 1 0 5 0)
          (on-draw draw_v_machine)
          (on-key action_v_machine))