#lang racket
;Author : Sean Fitzpatrick

;Define list of numbers to be used for generating six random numbers
(define ListOfNum (list 1 1 2 2 3 3 4 4 5 5 6 6 7 7 8 8 9 9 10 10 25 50 75 100))

;Define list of operators
;(define ops (list + - / *))

;Define random number between 101 and 999
;(define rand (random 101 1000))car ops

;Returns nth element from the list
(define a(list-ref (list 1 2 3 4 5 6) 4))

; Define procedure with two arguments, list and pos
(define (my-list-ref ls n)
  ; If pos is zero return first element in the list with car
  (if (zero? n)
      (car ls)
      ;Else return the rest of the list and get element at pos n-1
      (my-list-ref (cdr ls) (- n 1))))

;RPN taken from - https://rosettacode.org/wiki/Parsing/RPN_calculator_algorithm#Racket
(define (calculate-RPN expr)
  (for/fold ([stack '()]) ([token expr])
    ;(printf "~a\t -> ~a~N" token stack)
    (match* (token stack)
     [((? number? n) s) (cons n s)]
     [('+ (list x y s ___)) (cons (+ x y) s)]
     [('- (list x y s ___)) (cons (- y x) s)]
     [('* (list x y s ___)) (cons (* x y) s)]
     [('/ (list x y s ___)) (cons (/ y x) s)]
     [('^ (list x y s ___)) (cons (expt y x) s)]
     [(x s) (error "calculate-RPN: Cannot calculate the expression:" 
                   (reverse (cons x s)))])))


;Define random-element, returns random element from list
(define (random-element list)
  (list-ref list (random (length list))))

;Define string s
(define s "6 75 * 50 / 100 3 + * 25 +")

;Define permutations of three element list
(define lp (permutations (list 1 2 3)))

;Define shufffle for list
(define shuf (shuffle '(1 2 3 4 5 6 7 8 9 10 25 50 75 100)))

;Define cartesian-product for two numbers and 1 operator
(define cp (cartesian-product '(1 2 3) '(4 5 6) '(+ - / *)))

;Define cartesian-product for six numbers and five operators - Very bad!
;(define cp2 (cartesian-product '(1 2 3) '(4 5 6) '(+ - / *) '(1 2 3 4 5 6) '(+ - / *) '(1 2 3) '(4 5 6) '(+ - / *) '(+ - / *) '(1 2 3 4 5 6) '(+ - / *)))

;Define cartesian-product for six numbers and five operators - Not bad, each letter represents a randon number picked from list of numbers.
(define cp3 (cartesian-product '(a) '(b) '(+ - / *) '(c) '(+ - / *) '(d) '(e) '(+ - / *) '(+ - / *) '(f) '(+ - / *)))

;Define permeutations, cartesian-product and remove duplicates - 10 lists
(define cp4 (remove-duplicates (cartesian-product (permutations (list 'n 'n 'n 'o 'o)))))

;Define permutations, cartesian-product with duplicates - 120 lists
(define cp5 (cartesian-product (permutations (list 1 2 +))))

;Define list
(define lst (list 1 2 '+))

;Define permutations, cartesian-product with duplicates with defined list
(define cp6 (cartesian-product (permutations lst)))

(define (calcualte-RPN cp6)
  (if (null? cp6)
      0
(calculate-RPN(car cp6) (calcualte-RPN (cdr cp6)))))






