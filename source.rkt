#lang racket
;Author : Sean Fitzpatrick

;Define list of numbers to be used for generating six random numbers
(define ListOfNum (list 1 1 2 2 3 3 4 4 5 5 6 6 7 7 8 8 9 9 10 10 25 50 75 100))

;Define list of operators
(define ops (list + - / *))

;Define random number between 101 and 999
(define rand (random 101 1000))car ops

;Returns nth element from the list
(define a(list-ref (list 1 2 3 4 5 6) 4))

; Define procedure with two arguments, list and pos
(define (my-list-ref ls n)
  ; If pos is zero return first element in the list with car
  (if (zero? n)
      (car ls)
      ;Else return the rest of the list and get element at pos n-1
      (my-list-ref (cdr ls) (- n 1))))






