> **The Academic Honor Policy (see Brightspace) is applicable to all work you do in CS 3270/5270.**

# CS 3270: Programming Languages
## Homework 5

Fun with Racket streams and thunks

## Goal

To gain experience in using/writing Racket streams/thunks.

## GitHub notes

Please see [GitHub notes](github_notes.md) for more information on cloning, committing, and pushing repositories.

## Resources

You have been provided with several files:

* `src/hw05.rkt`: the file where you will write your functions.
* `src/hw05-test.rkt`: this file contains calls to test files in the `tests` folder, where each test file contains a test suite for a specific exercise. All calls to the test suites are intially commented out. All test suites should be uncommented before your final submission.
* `tests/hw05-test-01.rkt`, `tests/hw05-test-02.rkt`, ..., `tests/hw05-test-04.rkt`: files containing tests for each exercise.

Include comments at the top of the `hw05.rkt` and `hw05-test.rkt` indicating your name, email address, date, course number, and an honor statement. Add additional comments to describe each implemented function. All functions should at least have a comment header describing what they do.

The following are links to documentation on the Racket language website: [Racket Reference manual](http://docs.racket-lang.org/reference/index.html), [Racket Guide](http://docs.racket-lang.org/guide/index.html), [Racket Cheat Sheet](http://docs.racket-lang.org/racket-cheat/index.html).

## Exercises

These four problems explore *streams* and *thunks*. These problems are about creating/using our own streams by using thunks. This is ***not*** an assignment about using the `stream` functions that are built into Racket. Rather you are to complete this assignment using only `car`, `cdr`, `cons`, `lambda`, and other Racket functions that were described in class.

Warning: these four problems dive into streams. Some problems have short solutions, but may be difficult to complete. Go slowly and focus on using what you learned about thunks and streams. Your solution need not be as short as the suggested sample solution. Reminder: we discussed streams in lecture 16.

**Make sure you enable Travis on your repository.** Note that we may test your submission on several more test cases in addition to the tests in the `tests` folder that checks arbitrary number of elements from the stream.

1. Write a function called `stream-for-n-steps` that takes a stream `s` and a number `n`. It returns a list holding the first `n` values produced by `s` in order. Assume `n` is non-negative. Sample solution: five lines. Note: you can use this function to test the streams you will produce in the following problems. Also, consider the `stream-nth` function described in class.

2. Write a stream called `funky-stream` that is like the stream of natural numbers (i.e., 1, 2, 3, ...) except numbers divisible by 5 are negated (i.e., 1, 2, 3, 4, -5, 6, 7, 8, 9, -10, 11, ...). Remember a stream is a thunk that when called produces a pair. In this case the `car` of the pair will be a number and the `cdr` will be another stream. The built-in Racket function `remainder` performs modulo division.

3. Write a stream called `this-then-that`, where the elements of the stream alternate between the strings "If this" and "Then that" (starting with "If this"). More specifically, `this-then-that` should be a thunk that when called produces a pair of "If this" and a thunk that when called produces a pair of "Then that" and a thunk that when called, and so on. Sample solution: four lines. Note: you can type the strings "If this" and "Then that" in your code (with the double quotes).

4. Write a function called `stream-add-zero` that takes a stream `s` and returns another stream. If `s` would produce `v` for its *i*-th element, then `(stream-add-zero s)` would produce the dotted pair `(0 . v)` for its *i*-th element. Sample solution: four lines. Hint: Use a thunk that when called uses `s` and recursion.

## Reminders

* Ensure that your name, VUnetID, email address, and the honor code appear in the header comments of all files that you have altered.

* You are expected to follow style guidelines from previous assignments including comments before function definitions, line lengths up to 100 columns, meaningful names, and indentation. DrRacket can help you with indentation, select **Racket | Reindent All** to reindent the entire file, or **Racket | Reindent** to reindent the selected lines of code.

* You must only update `hw05.rkt` and uncomment the calls to test suites in `hw05-test.rkt`. Do not alter any other files (including all files in the `tests` folder)! If you'd like to add more test cases, you must put them in a separate file.

* Your submission must have all test suites in `hw05-test.rkt` uncommented.

* All files necessary to run your program must reside in the GitHub.com repository.

* For full credit, your program must pass the test build on Travis CI.

  * You will have to turn on Travis builds for your repository and then push to trigger a Travis build.