;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |filter map|) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp")))))
(list-ref (list "hop" "skip" "jump") 2)
(reverse (list "hop" "skip" "jump")) 
(member "fall" (list "hop" "skip" "jump"))
(map sqrt (list 1 4 9 16))

(map (lambda (number)
           (+ 1 number))
         '(1 2 3 4))

(foldl cons '() '(1 2 3 4))
(foldr cons '() '(4 3 2 1))
(remove 2 (list 1 2 3 2 4))
(filter positive? '(1 -2 3 4 -5))
(filter string? (list "a" "b" 6))

 (define (my-map f lst)
    (cond
     [(empty? lst) empty]
     [else (cons (f (first lst))
                 (my-map f (rest lst)))]))
