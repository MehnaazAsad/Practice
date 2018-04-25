> **The Academic Honor Policy (see Brightspace) is applicable to all work you do in CS 3270/5270.**

# CS 3270: Programming Languages
## Homework 6 (Part II)

Introduction to Prolog

## Goals

* Creating our own database of rules and relationships.
* Writing Prolog rules for processing lists and numbers.

## GitHub notes

Please see [GitHub notes](github_notes.md) for more information on cloning, committing, and pushing repositories.

## Travis note

This assignment **does not** have a Travis component to it. You **do not** need to enable Travis.

## Resources

The result of this assignment will be two files: `hw06.pl` and `hw06-ii-answers.txt`. Put all your Prolog rules into `hw06.pl` that can be loaded (consulted) by the SWI-Prolog interpreter. Please document your Prolog code with comments (at a minimum, identify your Prolog rules with the appropriate problem numbers given below).

When you are asked to answer questions or log the results of Prolog queries, place those in the file `hw06-ii-answers.txt`. Be sure to add descriptive text or question numbers to the file so that we can make sense of it all. For the questions numbers, include the step number, too. For example, for Question 3 of Step 1, use the number 1.3.

## Exercises

### Step 1 – Database processing and rules

Let's start off with a simple database and rules that define family relationships.

Assume you are given a set of facts of the form `parent(name1, name2)`, where `name1` is the parent of `name2`. Define the following rules in your `hw06.pl` file.

1. Define a predicate `sibling(X, Y)` that holds iff `X` and `Y` are siblings. Note that a person is not a sibling of themselves, so you will not want to produce that result. You can specify that two variables cannot unify to the same object by the rule `not(X = Y)`. Try your rule once without this additional term, see what happens, then add the term. The `not` predicate is your logical negation operator. [Please be careful how you use the `not(X = Y)` predicate. This predicate may not make sense until `X` and `Y` have been unified with actual values. Thus when using it in a rule, you should place it AFTER the other terms that cause `X` and `Y` to be unified with values.]

2. Define a predicate `cousin(X, Y)` that holds iff `X` and `Y` are cousins. We are only interested in first cousins.

3. Define a predicate `grandchild(X, Y)` that holds iff `X` is a grandchild of `Y`.

4. Define a predicate `descendant(X, Y)` that holds iff `X` is a descendant of `Y`.

5. Consider the following genealogical tree (included in the `hw06.pl` file):

   ```Prolog
   parent(a, b).   % 1
   parent(a, c).   % 2
   parent(b, d).   % 3
   parent(b, e).   % 4
   parent(c, f).   % 5
   parent(d, g).   % 6
   parent(d, h).   % 7
   parent(d, i).   % 8
   ```

   whose graphical representation is:

   ```Prolog
            a
          /   \
         b     c
       /   \   |
      d     e  f
    / | \
   g  h  i
   ```

   In `hw06-ii-answers.txt` copy-n-paste what answers are generated, and in which order, for the following queries:

   ```Prolog
   ?- sibling(X, Y).
   ?- cousin(X, Y).
   ?- grandchild(X, Y).
   ?- descendant(X, Y).
   ```

### Step 2 – List processing

Consider representing a *set* as a list of values (no duplicates). Define the following predicates in your `hw06.pl` file (to avoid unnecessary warning messages from the Prolog interpreter, use the "don't care" variable `_` (i.e., the underscore) to represent variables that don't matter – as demonstrated in lecture):

1. `member2(X, L)` that holds iff the element `X` occurs in `L`. You can use the one we defined in lecture.

2. `subset2(L, K)` that holds iff `L` is a subset of `K`. Hint: use your `member2` predicate.

3. `disjoint2(L, K)` that holds iff `L` and `K` are disjoint (i.e., they have no elements in common). Hint: use the `not` predicate in conjunction with your `member2` predicate.

4. `union2(L, K, M)` that, given two lists `L` and `K`, will produce their union `M`. The input sets, `L` and  `K`, will not contain duplicates since they represent sets. The union can be done in two ways:

   a. You allow duplicates in the list `M`. In this case you can simply merge `L` and `K`. This predicate is quite easy and acceptable.

   b. You do not allow duplicates in the list `M`. This one is a bit more tricky. Extra credit if you do it this way. Be sure to note in a comment next to your predicate that you did the extra credit version.

5. `intersection2(L, K, M)` that, given two lists `L` and `K`, will produce their intersection `M`.

   When we grade the above five predicates, we will always provide sets (no duplicates) as parameters.

   The following two rules are for generic list processing, rather than processing of sets.

6. `reverse2(L1, L2)` that holds iff the list `L1` is the reverse of `L2`. Or alternatively, produces `L2` given `L1`. You can do this one of two ways:

   a. You can utilize the `append(L1, L2, Result)` that results in a slower function.

   b. You can create a tail-recursive helper function that utilizes an accumulator. In this case, `reverse2` still takes only two parameters, but calls the helper function to do all the work.

7. `flatten2(L1, L2)` that, given a list of lists `L1`, will produce a list `L2`, where the top level lists have been flattened into a single list. We are only flattening the top level lists (and not attempting to flatten any sublists). Here are some examples:

   ```Prolog
   ?- flatten2([[1, 2], [3, 4], [5, 6]], L2). 
   L2 = [1, 2, 3, 4, 5, 6].   

   ?- flatten2([[1, 2], [3, 4, [5, 6]]], L2).
   L2 = [1, 2, 3, 4, [5,6]].   

   ?- flatten2([[1, 2], [3, 4], 5, 6], L2).
   false. % since all top level items are not lists
   ```

### Step 3 – List processing and numbers

Define the following predicates in your `hw06.pl` file. You may/should define helper predicates as needed. Challenge: make these helper predicates tail-recursive by using an accumulator.

1. `sumlist2(L, N)` that, given a list of integers `L`, returns the sum `N` of all the elements of `L`.

2. `occurrences(X, L, N)` that holds iff the element `X` occurs `N` times in the list `L`.

3. `occurs(L, N, X)` that holds iff `X` is the element occurring in position `N` of the list `L`. Let's use zero-based indexing in our list, so that `occurs([a, b, c], 1, b)` is `true.`

### Step 4

Add your name, email address, VUnetID, and honor statement to the top of your `hw06.pl` file and your `hw06-ii-answers.txt` file.

As reminder, this assignment **does not** have a Travis component to it. You **do not** need to enable Travis.