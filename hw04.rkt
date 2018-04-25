#lang racket

(provide (all-defined-out)) ;; so hw04-test-*.rkt files can access the functions

;; Name: Mehnaaz Asad
;; Email: mehnaaz.asad@vanderbilt.edu
;; Date: 02/24/2018
;; Course: CS 5270
;; Honor statement: I pledge to pursue all academic endeavors with honor and integrity. I understand
;; the principles of the Honor System, and I promise to uphold these standards by adhering to the
;; Honor Code in order to preserve the integrity of Vanderbilt University and its individual
;; members.

;; Description: Function definitions.

;;1. A function (duple n item) that will return a list containing n copies of item. 
(define (duple n item)
  (if (= n 1)
      (list item)
      (append (duple (sub1 n) item) (list item))))

;;2. A function (sequence low high stride) that takes three arguments low, high, and stride, all assumed to be numbers. Further assume stride is positive. The function produces a list of numbers from low to high (including low and possibly high) separated by stride and in sorted order.
(define (sequence low high stride)
  (if (> low high)
      '()
      (append (list low) (sequence (+ low stride) high stride))))

;; Function that calculates length of a list
(define (my-length lst)
  (if (null? lst)
      0
      (add1 (my-length (cdr lst)))))

;;3. A function (get-nth n lst) that returns the n-th item from the list lst.
(define (get-nth n lst)
  (cond
    ((>= n (my-length lst)) #f)
    (#t (if (= n 0)
            (car lst)
            (get-nth (sub1 n) (cdr lst))))))

;;4. A function (set-nth n lst val) that returns a list that is the same as the original list lst except that the n-th item has been replaced with val.
(define (set-nth n lst val)
  (cond
    ((>= n (my-length lst)) lst)
    (#t (if (= n 0)
            (append (list val) (cdr lst))
            (append (list(car lst)) (set-nth (sub1 n) (cdr lst) val))))))

;;5. A function (get-board-value board row col) that takes a two-dimensional board (a list of lists) and returns the col-th item from the row-th list.
(define (get-board-value board row col)
  (cond
    ((>= row (my-length board)) #f)
    ((>= col (my-length (get-nth row board))) #f)
    (else (get-nth col (get-nth row board)))))

;;6. A function (set-board-value board row col val) that returns a board (2-D list of lists) that is the same as the original board except that the col-th item of the row-th list has been replaced with val.
(define (set-board-value board row col val)
  (cond
    ((>= row (my-length board)) board)
    ((>= col (my-length (get-nth row board))) board)
    (#t (if (= row 0)
            (append (list(set-nth col (car board) val )) (cdr board))
            (append (list(car board)) (set-board-value (cdr board) (sub1 row) col val))))))

;;7. A function (euclid point1 point2) that accepts two parameters, each being a list containing exactly two numbers that define a two-dimensional point. Returns the Euclidean distance between the two points.
(define (euclid point1 point2)
  (cond
    ((not (list? point1)) #f)
    ((not (list? point2)) #f)
    ((not (= (my-length point1) 2)) #f)
    ((not (= (my-length point2) 2)) #f)
    ((not (number? (car point1))) #f)
    ((not (number? (cadr point1))) #f)
    ((not (number? (car point2))) #f)
    ((not (number? (cadr point2))) #f)
    (#t (sqrt (+ (* (- (car point1) (car point2)) (- (car point1) (car point2))) (* (- (cadr point1) (cadr point2)) (- (cadr point1) (cadr point2))))))))

;;8. A function (path-distance lst) that calls the euclid function and computes the length of a path that consists of a sequence of connected straight line segments.
(define (path-distance lst)
  (cond
    ((not (list? lst)) #f)
    ((null? lst) 0)
    ((= (my-length lst) 1) 0)
    ((not (number? (euclid (car lst) (cadr lst)))) #f)
    ((not (number? (path-distance (cdr lst)))) #f)
    (else (if (= (my-length lst) 2)
              (euclid (car lst) (cadr lst))
              (+ (euclid (car lst) (cadr lst)) (path-distance (cdr lst)))))))

;;9. A function (is-older date1 date2) that takes two dates and returns true if the first date is before the second; else false.
(define (is-older date1 date2)
  (cond
    ((> (car date1) 31)
     (let* ([year1 (car date1)]
            [month1 (cadr date1)]
            [day1 (caddr date1)]
            [year2 (car date2)]
            [month2 (cadr date2)]
            [day2 (caddr date2)]
            [total1 (+ (* year1 12 31) (* month1 31) day1)]
            [total2 (+ (* year2 12 31) (* month2 31) day2)])
       (if (< total1 total2)
           #t
           #f)))
    ((< (car date1) 31)
     (let* ([year1 (car date1)]
            [month1 (cadr date1)]
            [day1 (caddr date1)]
            [year2 (car date2)]
            [month2 (cadr date2)]
            [day2 (caddr date2)]
            [total1 (+ (* year1 12 31) (* month1 31) day1)]
            [total2 (+ (* year2 12 31) (* month2 31) day2)])
       (if (< total1 total2)
           #t
           #f)))))

;;10. A function (number-in-month datelist month) that takes a list of dates and a month (i.e., an integer) and returns how many dates in the list are in the given month.
(define (number-in-month datelist month)
  (cond
    ((zero? (my-length datelist)) 0)
    (#t (if (eq? (cadr(car datelist)) month)
            (add1 (number-in-month (cdr datelist) month))
            (number-in-month (cdr datelist) month)))))

;;11. A function (number-in-months datelist monthlist) that takes a list of dates and a list of months (i.e., a list of integers) and returns the number of dates in the list of dates that are in any of the months in the list of months. 
(define (number-in-months datelist monthlist)
  (foldr + 0 (map (lambda (month) (number-in-month datelist month)) monthlist)))

;;12. A function (down lst) that wraps parentheses around all top-level elements of lst.
(define (down lst)
  (if (null? lst)
      '()
      (append (list(list(car lst))) (down (cdr lst)))))

;;Function (that up calls below) that checks if a value in a list is a list; returns the value if it is and makes it a list if it isn't.
(define (check-if-list val)
  (if (list? val)
      val
      (list val)))    

;;13. A function (up lst) that removes all top-level parentheses if present (just the opposite of down).
(define (up lst)
  (if (null? lst)
      '()
      (append (check-if-list (car lst)) (up (cdr lst)))))