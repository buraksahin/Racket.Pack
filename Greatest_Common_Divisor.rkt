;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |ekok ebob vs|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(define (ebob n m)
  (cond
    [(= n m) n]
    [(= n 0) m]
    [else (local ((define (bul min max)
                    (cond
                      [(= min 0) max]
                      [else
                       (bul (remainder max min) min)])))
                    (bul (min n m) (max n m)))]))

(ebob 96 20)

;; Greatest common divisor