#lang racket
;Author : Sean Fitzpatrick

;Define list of numbers to be used for generating six random numbers
(define ListOfNum (list 1 1 2 2 3 3 4 4 5 5 6 6 7 7 8 8 9 9 10 10 25 50 75 100))

;Define list of operators
;(define ops (list + - / *))

;Define random number between 101 and 999
(define rand (random 101 1000))

;Returns nth element from the list
(define a(list-ref (list 1 2 3 4 5 6) 4))

; Define procedure with two arguments, list and pos
(define (my-list-ref ls n)
  ; If pos is zero return first element in the list with car
  (if (zero? n)
      (car ls)
      ;Else return the rest of the list and get element at pos n-1
      (my-list-ref (cdr ls) (- n 1))))

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

;Creates static list of numbers and operators
(define f null)

;static list of operands
(define op (list '+ '+ '+ '+ '+ '- '- '- '- '- '- '* '* '* '* '*  '/ '/ '/ '/ '/))

;Sourced from https://rosettacode.org/wiki/Parsing/RPN_calculator_algorithm#Racket
(define (calculate-RPN expr)
  (for/fold ([stack '()]) ([token expr])
    ;(printf "~a\t -> ~a~N" token stack) ; Uncomment to see workings, not recommended for long lists.
    (match* (token stack)
     [((? number? n) s) (cons n s)]
     [('+ (list x y s ___)) (cons (+ x y) s)]
     [('- (list x y s ___)) (cons (- y x) s)]
     [('* (list x y s ___)) (cons (* x y) s)]
     [('/ (list x y s ___)) (if (= y 0)
                                (cons 0 s)
                                (if (= x 0)
                                    (cons 0 s)
                                    (cons (/ x y) s)))]
     [(x s) (error "calculate-RPN: Cannot calculate the expression:" 
                   (reverse (cons x s)))])))

 
;takes in (e list) and (r empty stack)
(define (valid-rpn? e[r 0])
  ;if e is null
  (if(null? e)
     ;if stack == 1 return true else false
     (if (= r 1)
         #t
         #f)
     ;check if first element on the list e is (valid rpn) number
     (if(number? (car e) )
        ;if valid rpn add element to (r stack) 
        (valid-rpn? (cdr e) (+ r 1))
        ;if (r stack) has more than one number on the stack
        (if(> r 1)
           (valid-rpn? (cdr e) (- r 1))
           #f))))


;define (x list) and (t target) number
(define (sum x t)
  ;if x is null 0
  (if (null? x)
      0
      ;cond if/else
      (cond [(valid-rpn? (car x))
             ;eqv is equals
             (cond [(eqv? (car (calculate-RPN (car x))) t)
                    ;writeln writes on console
                    (writeln (car x))]
                   ;moves onto next list of numbers
                   [else (sum (cdr x) t)])]
            ;moves onto next list of numbers
            [else (sum (cdr x) t)])))

;define make list mklist (l original list of numbers for calculation )- (s 2)new stack - g list null
(define (mklist l (s 2) (g null))
  ;cond - if s <= length l
  (cond ((<= s (length l))
         ;retrieve all combinations of list l - number of elements depend on the value s
         ;append elemnts and operators to g
         (mklist l (+ s 1)
                 (append g (cartesian-product (combinations l s) (remove-duplicates(combinations op (- s 1)))))))
        ;return g
        (else  g)))

;define rpn (l list - original list) (t target number)
(define (rpn l t)
  ;set f to be (mklist l) - what g will be
  (set! f (mklist l)) (makep f t))
;define makep l and gie t target number
(define (makep l t)
  ;is the list l empty
  (cond [(null? l) (write 'Target:) t]
        ;flatten
      [else (sum (permutations (flatten (car l))) t)(makep (cdr l) t)]))

"To run (rpn (list 'six numbers') Target Number)"
"Example (rpn (list 1 2 3 4 25 50) 100)"
"If you want target number use 'rand'"







