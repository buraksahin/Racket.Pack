;; Definitions

(define WIDTH 500)
(define DEPTH 500)
(define WIDTH-t 200)
(define HEIGHT-t 400)
(define r 10)

(define vS 5)
(define vT 50)

(define BALL (circle r 'solid 'red))
(define TABLE (rectangle WIDTH-t HEIGHT-t 'solid 'blue))
(define BACKGROUND-SCENE (empty-scene WIDTH DEPTH))

(define xB (+ WIDTH-t r))
(define yB (- (- DEPTH HEIGHT-t) r))

;;helper function
;;contract: hF: number -> number
;;purpose: calculating the distance taken in time t during free fall

(define (hF tF) (* 5 (* tF tF)))

;;helper function
;;contract: dS: number -> number
;;purpose: calculating the distance taken by an object in time t with the constant speed v

(define (dS tS) (* vS tS))

;;helper function
;;contract: dT: number -> number
;;purpose: calculating the distance taken by an object in time t with the constant speed v

(define (dT tT) (* vT tT))

;;Code
;;Contract: FALL: number -> scene

(define (FALL dF)
  (place-image 
   BALL
   xB
   (hF dF)
   BACKGROUND-SCENE))

;;Contract: THROW: number -> scene

(define (THROW tT)
  (place-image
   BALL
   xB
  (- DEPTH (- (dT tT) (hF tT)))
   BACKGROUND-SCENE))
 
;;Contract: SLIDE: number -> scene

(define (SLIDE tS)
  (place-image
   BALL
   (dS tS)
   yB
  
   (place-image
   TABLE
   (pinhole-x TABLE)
   (- DEPTH (pinhole-y TABLE))
   BACKGROUND-SCENE)))

;;Contract: FALL2: number -> scene

(define (FALL2 tS)
  (place-image
   BALL
   (+ xB (dS tS))
   (+ yB (hF tS))
   
   
   (place-image
    TABLE
    (pinhole-x TABLE)
    (- DEPTH (pinhole-y TABLE))
    BACKGROUND-SCENE)))

;;Contract: SLIDE-FALL: number -> scene

(define (SLIDE-FALL t)
    (if (>  WIDTH-t (dS t))
        (SLIDE t)
        (FALL2 (- t (/ WIDTH-t vS)))))
       
        
;(run-simulation WIDTH DEPTH (/ 1 10) FALL)   
;(run-simulation WIDTH DEPTH (/ 1 10) THROW)
;(run-simulation WIDTH DEPTH (/ 1 10) SLIDE-FALL)




