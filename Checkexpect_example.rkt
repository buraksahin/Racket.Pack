;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 2nd_week_quiz_Racket) (read-case-sensitive #t) (teachpacks ((lib "image.ss" "teachpack" "htdp") (lib "universe.ss" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.ss" "teachpack" "htdp") (lib "universe.ss" "teachpack" "2htdp")) #f)))
;; For testing function
;; str1:string str2:string i:number k:number -> String
;; str1 and str2: any word or sentence
;; i-> length of str1 : start point for str1.
;; 0 -> k: end point for str2
(define (add str1 str2 i k)
  (string-append (substring str1 i (string-length str1)) (substring str2 0 k)))

;; Testing
(check-expect (add "Ali Veli" "Burak Sahin" 4 5) "VeliBurak")
(check-expect (add "abcde Birikiuc" "Dortbesaltı Yedisekiz" 6 11) "BirikiucDortbesaltı")
(check-expect (add "bilgisayar bilimleri" "Computer science" 11 8) "bilimleriComputer")