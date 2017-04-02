#lang racket
;Author : Sean Fitzpatrick

;Define list of numbers to be used for generating six random numbers
(define ListOfNum (list 1 1 2 2 3 3 4 4 5 5 6 6 7 7 8 8 9 9 10 10 25 50 75 100))

;Define list of operators
(define ops (list + - / *))

;Define random number between 101 and 999
(define rand (random 101 1000))car ops

;Returns nth element from the list
(define a(list-ref (list 'a 'b 'c 'd 'e 'f) 4))






