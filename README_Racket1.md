> **The Academic Honor Policy (see Brightspace) is applicable to all work you do in CS 3270/5270.**

# CS 3270: Programming Languages
## Homework 4

Fun with Racket, lists, and such


## Goal

To gain experience in writing Racket functions. Particularly functions that process lists.

## GitHub notes

Unfortunately (or perhaps fortunately), the DrRacket IDE does not have version control support. This means that you will need to do any tasks associated with Git and GitHub such as cloning, committing, and pushing, on the command line. Please see [GitHub notes](github_notes.md) for more information.

## Resources

You have been provided with several files:

* `src/hw04.rkt`: the file where you will write your functions.
* `src/hw04-test.rkt`: this file contains calls to test files in the `tests` folder, where each test file contains a test suite for a specific exercise. All calls to the test suites are intially commented out. The semicolon is the comment delimiter – anything on a line after a semicolon is considered a comment. You should uncomment the calls to the test suites one at a time as you solve each exercise by deleting the semicolon.
* `tests/hw04-test-01.rkt`, `tests/hw04-test-02.rkt`, ..., `tests/hw04-test-13.rkt`: files containing tests for each exercise. The tests are exactly as those listed in this document for each exercise.

Include comments at the top of the `hw04.rkt` and `hw04-test.rkt` indicating your name, email address, date, course number, and an honor statement. Add additional comments to describe each implemented function. As in any programming language, commenting your code is considered good programming style. All functions should at least have a comment header describing what they do.

The following are links to documentation on the Racket language website: [Racket Reference manual](http://docs.racket-lang.org/reference/index.html), [Racket Guide](http://docs.racket-lang.org/guide/index.html), [Racket Cheat Sheet](http://docs.racket-lang.org/racket-cheat/index.html). However, note that all the solutions should be written in a ***functional (non-destructive)*** fashion. This means, for example, that you always create new lists for return values, and do not mutate the original parameter lists of the function. Hence, do not use functions such as the `set!` function. If you do, you will essentially be doing imperative programming in a functional programming environment.

**Note:** all functions in the "Exercises" section can be implemented using functions that were described in class.

## Assignment

Define the functions described below under the "Exercises" section in the text file called `hw04.rkt`.

The `hw04.rkt` file already contains several lines of code (as seen below). Define your functions after these lines.

```Racket
#lang racket

(provide (all-defined-out)) ;; So hw04-test-*.rkt files can access the functions.

;; Name:
;; Email:
;; Date:
;; Course:
;; Honor statement:

;; Description:
```

Make sure to save `hw04.rkt` after you update a definition(s). Unlike CLion, files are not autosaved every time an edit occurs. If you don't save, then the old definition(s) will still be stored and will be used in the REPL.

As you complete each function definition, uncomment the call to the test suite associated to the exercise in `hw04-test.rkt`. To uncomment the call, you will need to uncomment two lines:

* Remove the `require` function (between lines 3 - 15)
* Remove the call to the test suite (between lines 26 - 38)

For example, when you want to test the function `duple` (i.e., Exercise 1), uncomment the line `(require "../tests/hw04-test-01.rkt")` (line 3) and also the line `test-exercise-01` (line 26).

When a test case fails, an error message will be displayed in the REPL. For example:

```Racket
--------------------
test-exercise-01 > Homework 4 > (duple 3 'hello)
. ..\tests\hw04-test-01.rkt:13:2: FAILURE
name:       check-equal?
location:   ..\tests\hw04-test-01.rkt:13:2
actual:     '(hello hello)
expected:   '(hello hello hello)
--------------------
43 success(es) 1 failure(s) 0 error(s) 44 test(s) run
1 ; ignore this
> 
```

In this failed test case, the failure occurred in the test suite for Exercise 1 (i.e., `test-exercise-01`). The expected output should have been `'(hello hello hello)`, but the output of the function was `'(hello hello)`. The function call that was tested was `(duple 3 hello)`. You can copy-and-paste this function call into the REPL for `hw04.rkt` to test the call manually (you may need to **Run** the file first).

If all tests in the `tests` folder passed, you should receive the following message:

```Racket
44 success(es) 0 failure(s) 0 error(s) 44 test(s) run
0 ; ignore this
> 
```

**Make sure you enable Travis on your repository.**

Note that we may test your submission on several more test cases in addition to the tests in the `tests` folder.

## Exercises

You must not solve any of the exercises below with a pre-defined function in Racket that exactly solves the exercise. For example, you are prohibited from using `list-set` for Exercise 4. However, it is okay to use two or more pre-defined functions to solve an exercise.

And again, all the solutions should be written in a ***functional (non-destructive)*** fashion. This means, for example, that you always create new lists for return values, and do not mutate the original parameter lists of the function. Hence, do not use functions such as the `set!` function. If you do, you will essentially be doing imperative programming in a functional programming environment.

Your solutions do not have to be tail recursive solutions.

In the function descriptions that follow, `n` represents a number parameter, and `lst` (*el-s-t*, not *one-s-t*) represents a list parameter.

1. Write a function `(duple n item)` that will return a list containing `n` copies of `item`. You may assume `n` is non-negative. Our solution is four lines long. Example:

   ```Racket
   > (duple 3 'hello)
   '(hello hello hello)
   > (duple 3 '(dog night))
   '((dog night) (dog night) (dog night))
   > (duple 1 'hello)
   '(hello)
   ```

2. Write a function `(sequence low high stride)` that takes three arguments `low`, `high`, and `stride`, all assumed to be numbers. Further assume `stride` is positive. The function produces a list of numbers from `low` to `high` (including `low` and possibly `high`) separated by `stride` and in sorted order. Our solution is four lines long. Examples:

   ```Racket
   > (sequence 3 11 2)
   '(3 5 7 9 11)
   > (sequence 3 8 3)
   '(3 6)
   > (sequence 3 2 1)
   '()
   ```

3. Write a function `(get-nth n lst)` that returns the n-th item from the list `lst`. The numbering of items in a list is zero based (similar to arrays). If there is not an n-th item in the list, `get-nth` should return `#f`.

   ```Racket
   > (get-nth 0 '(b a e))
   'b
   > (get-nth 2 '(w x y z))
   'y
   > (get-nth 2 '((a) (b c) ((d)) e))
   '((d))
   > (get-nth 4 '(a b c d))
   #f
   ```

4. Write a function `(set-nth n lst val)` that returns a list that is the same as the original list `lst` except that the n-th item has been replaced with `val`. The numbering of items in a list is zero based (similar to arrays). If there is not an n-th item in the list, `set-nth` should return a list that is equal to the original list. Your solution must be done in a non-destructive way; i.e., you cannot alter the original `lst`. Note: use of `car`, `cdr`, and `cons` is okay as they will create a new list (even though the tail part of the list may still be shared with the original list).

   ```Racket
   > (set-nth 0 '(a b c) 1)
   '(1 b c)
   > (set-nth 2 '(a b c) 2)
   '(a b 2)
   > (set-nth 3 '(a b c) 3)
   '(a b c)
   > (set-nth 2 '((a) (b c) ((d)) e) 'hello)
   '((a) (b c) hello e)
   > (set-nth 4 '(a b c d) 'bye)
   '(a b c d)
   ```

5. Write a function `(get-board-value board row col)` that takes a two-dimensional board (a list of lists) and returns the `col`-th item from the `row`-th list. Again, the rows as well as the columns use zero-based indexing. If `row` or `col` are out of range for the given board, return `#f`. Hint: simply use your `get-nth` function appropriately.

   ```Racket
   > (get-board-value '((a b c) (d e f) (g h i)) 0 0)
   'a
   > (get-board-value '((a b c) (d e f) (g h i)) 0 1)
   'b
   > (get-board-value '((a b c) (d e f) (g h i)) 1 0)
   'd
   > (get-board-value '((a b c) (d e f) (g h i)) 2 2)
   'i
   > (get-board-value '((a b c) (d e f) (g h i)) 1 3)
   #f
   ```

6. Write a function `(set-board-value board row col val)` that returns a board (2-D list of lists) that is the same as the original `board` except that the `col`-th item of the `row`-th list has been replaced with `val`. If `row` or `col` are out of range for the given board, return a board that is equal to the original board. As with `set-nth`, this must be done in a non-destructive way. Hint: use your `get-nth` and `set-nth` functions appropriately -- though their application is a bit trickier than the preceding exercise.

   ```Racket
   > (set-board-value '((a b c) (d e f) (g h i) (j k l)) 0 0 99)
   '((99 b c) (d e f) (g h i) (j k l))
   > (set-board-value '((a b c) (d e f) (g h i) (j k l)) 1 0 99)
   '((a b c) (99 e f) (g h i) (j k l))
   > (set-board-value '((a b c) (d e f) (g h i)) 2 2 'END)
   '((a b c) (d e f) (g h END))
   > (set-board-value '((a b c) (d e f) (g h i)) 1 3 'bad)
   '((a b c) (d e f) (g h i))
   ```

7. Write a function `(euclid point1 point2)` that accepts two parameters, each being a list containing exactly two numbers that define a two-dimensional point. Return the Euclidean distance between the two points. Use `cond` to check for the proper input (lists that contain exactly two numbers). If the input is improper, return `#f`. The mathematical definition of Euclidean distance is the square root of the sum of the square of the difference of the x values and the square of the difference of the y values.

   ```Racket
   > (euclid '(0 0) '(3 4))
   5
   > (euclid '(0 0) '(a 10))
   #f
   > (euclid '(1 2.0) '(7 10))
   10.0
   > (euclid 0 '(7 10)) ; the first parameter is not a list
   #f
   > (euclid '(0 0) '(a 10)) ; a is not a number
   #f
   ```

8. In this exercise you will define a function `(path-distance lst)` that calls the `euclid` function that you just defined in the exercise above. This new function computes the length of a path that consists of a sequence of connected straight line segments. The function takes one argument. This argument must evaluate to a list of two-dimensional points. Each point is given as in the exercise above. Your function will compute the length of the path starting at the first point and continuing through the list of two-dimensional points until the last point is processed. If the input is improper, return `#f`.

   ```Racket
   > (path-distance '((0 0) (3 4) (5 4) (8 0)))
   12 ; or 12.0 is okay too
   > (path-distance '((0 0) (3 a) (5 4) (8 0)))
   #f
   > (path-distance 'hello) ; argument is not a list
   #f
   ```

   Your `path-distance` function should not recheck any condition that `euclid` will check. It is recommended that you add in the error detection after you get the base function working correctly. An empty list and a list of just one point are both valid input – the function should return a distance of zero in both cases.

   Problem 9 – 11 deal with calendar dates. We will represent a "date" in Racket by using a list of three integers, where the first integer in the list is the year, the second integer is the month, and the third integer is the day. A "reasonable" date has a positive year, a month between 1 and 12, and a day no greater than 31 (or less depending on the month). Your solutions need to work correctly only for reasonable dates, and you do not need to check for reasonable dates – you can assume all dates given to you will be reasonable.

9. Write a function `(is-older date1 date2)` that takes two dates and evaluates to true or false. It evaluates to true if the first argument is a date that comes before the second argument. (If the two dates are the same, the result is false.) Hint: use a `let` expression to capture the different pieces of the dates.

   ```Racket
   > (is-older '(2015 3 15) '(2016 7 4))
   #t
   > (is-older '(1 2 98) '(3 5 201))
   #t
   > (is-older '(3 5 201) '(1 2 98))
   #f
   > (is-older '(5 4 4) '(4 5 4))
   #f
   > (is-older '(3 3 3) '(3 3 3))
   #f
   ```

10. Write a function `(number-in-month datelist month)` that takes a list of dates and a month (i.e., an integer) and returns how many dates in the list are in the given month.

    ```Racket
    > (number-in-month '((2015 3 15) (2016 1 1) (2016 3 1) (2016 2 17)) 3)
    2
    > (number-in-month '((2015 3 15) (2016 1 1) (2016 3 1) (2016 2 17)) 1)
    1
    > (number-in-month '((2015 3 15) (2016 1 1) (2016 3 1) (2016 2 17)) 6)
    0
    ```

11. Write a function `(number-in-months datelist monthlist)` that takes a list of dates and a list of months (i.e., a list of integers) and returns the number of dates in the list of dates that are in any of the months in the list of months. Assume the list of months has no number repeated. Hint: Use your answer to the previous exercise.

    ```Racket
    > (number-in-months '((2015 3 15) (2016 1 1) (2016 3 1) (2016 2 17)) '(3 1 6))
    3
    ```

12. Write a function `(down lst)` that wraps parentheses around all top-level elements of `lst`.

    ```Racket
    > (down '(1 2 (3 4) ((5))))
    '((1) (2) ((3 4)) (((5))))
    ```

13. Write a function `(up lst)` that removes all top-level parentheses if present (just the opposite of `down`). If an item is not inside parentheses, then simply leave it unchanged.

    ```Racket
    > (up '((1) (2) ((3 4)) (((5)))))
    '(1 2 (3 4) ((5)))
    > (up '((1) 2 (3 4)))
    '(1 2 3 4)
    ```

## Reminders

* Ensure that your name, VUnetID, email address, and the honor code appear in the header comments of all files that you have altered.

* You are expected to follow style guidelines from previous assignments including comments before function definitions, line lengths up to 100 columns, meaningful names, and indentation. DrRacket can help you with indentation, select **Racket | Reindent All** to reindent the entire file, or **Racket | Reindent** to reindent the selected lines of code.

* You must only update `hw04.rkt` and uncomment the calls to test suites in `hw04-test.rkt`. Do not alter any other files (including all files in the `tests` folder)! If you'd like to add more test cases, you must put them in a separate file.

* Your submission must have all test suites in `hw04-test.rkt` uncommented.

* All files necessary to run your program must reside in the GitHub.com repository.

* For full credit, your program must pass the test build on Travis CI.

  * You will have to turn on Travis builds for your repository and then push to trigger a Travis build.