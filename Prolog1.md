> **The Academic Honor Policy (see Brightspace) is applicable to all work you do in CS 3270/5270.**

# CS 3270: Programming Languages
## Homework 6 (Part I)

Introduction to Prolog

## Goals

* Learn how to start up the Prolog interpreter and to load files.
* Learn how to track down syntax errors in a Prolog file.
* Learn how to specify queries of different types and get all possible answers.
* Learn how to trace the execution of the rule unification process.

## GitHub notes

Please see [GitHub notes](github_notes.md) for more information on cloning, committing, and pushing repositories.

## Travis note

This assignment **does not** have a Travis component to it. You **do not** need to enable Travis.

## Exercises

SWI-Prolog Reference Manual: [ [HTML](http://www.swi-prolog.org/pldoc/refman/)  | [PDF](http://www.swi-prolog.org/download/stable/doc/SWI-Prolog-7.6.0.pdf) ]

### Step 1

Start up the interpreter to make sure it runs. Select **File | Edit ...** and find the SWI-Prolog `demo` directory (on Windows is it "C:\Program Files\swipl\demo"; on Mac the demo folder is under the installation folder), and select the `likes.pl` file (once in the correct directory, you may need to use the **Prolog Source** menu near the lower right to select different extensions so that you can see the specified file). This will pop-up the Prolog editor on the same file we investigated in lecture. Take a look at what is there, paying attention to the syntax of the file (i.e., notice comments, periods at the end of rules). In the editor window, select **Compile buffer | Compile**. The file is then loaded into the interpreter. You can now run some tests.

Enter the following queries at the Prolog prompt:

```Prolog
?- listing(likes).
?- listing(italian).
```

Now try some simple queries like the ones we did in lecture:

```Prolog
?- likes(sam, What).
?- likes(Who, chips).
?- likes(sam, spaghetti).
?- likes(sam, ballet).
?- indian(X).
?- mild(X).
```

When the system replies to your query and does not return you to the system prompt, there may be more results to be presented. Type a *semicolon* or hit the *spacebar* if you want more results, otherwise hit *enter* and you will be returned to the system prompt.

Next, let's see what's going on when we type in a query. We can do this by entering the command `trace.` followed by our query. So type in the following (remember the periods):

```Prolog
?- trace.
?- likes(sam, X).
```

You can then press the *enter* key to step through the unification process of your query. Hitting the `h` key will display a help menu. You can abort the trace by hitting the `a` key. Do not try to "exit" the trace by hitting the `e` key as that causes you to exit the Prolog interpreter. When you get one result, you still need to hit the `;` key if you want more results – hitting *enter* at that point will stop your search. To turn tracing off, you hit the `n` key while a trace is being executed.

### Step 2

Next, look at the `errors.pl` file in SWI-Prolog. Several syntax errors will be reported when the file is loaded. Open the file in the editor (**File | Edit ...**), search for `errors.pl`, and find and fix the errors. Fix the errors one at a time, saving the file after each fix. After saving the file, switch to the interpreter window and reload the file by selecting **File | Reload modified files** or **File | Consult ...** and find the desired file. Repeat this process until all syntax errors are corrected. Again, fix the errors one at a time so that you can see the error messages produced and connect them with the error in the file.

### Step 3

Next, we'll experiment with the "Presidents" database that we played with in lecture. Consult the `presidents.pl` file by using **File | Consult ...**.

Enter queries to answer the following questions. Copy all your queries and answers into the `hw06-i-answers.txt` file so that they can be included in the submission for grading. Recall that you can use the underscore character `_` whenever a predicate has entries which you "don't care" about.

1. Which presidents have the first name of "James"? (this is an exact match, i.e., only presidents with the first name "James" with no middle name)

2. Which presidents were members of the Whig party?

3. Who entered office in 1913?

   Now load the `presidents.pl` file into the editor by using **File | Edit...**. At the bottom of the file, define a new rule called `leftoffice(Who, When)` that can be used to determine who left office on what dates.

   Define another rule called `enteredoffice(Who, When)` that can be used to determine who entered office on what dates. In both of these cases, `Who` is meant to be the president's last name (we will not be interested in first names). After you save the file and reload it in the interpreter, use your new rules to answer the following questions (again, copying all queries and answers into `hw06-i-answers.txt`).

4. Which president left office in 1877?

5. When did Truman leave office?

6. Who entered office in 1945?

7. Which president followed Pierce? (answer this with a single query that has two terms)

   Next, switch to the edit window of the `presidents.pl` file and define a rule called `party(President, Party)` that can be used to find the party of a president or list all the presidents of a party. Using your new `party()` rule, define two additional rules `democrat(President)` and `republican(President)` that returns true only if the `President` is a member of the democratic or republican party, respectively. After you save the file and reload it in the interpreter, use your new rules to answer these questions (again, copying all queries and answers into `hw06-i-answers.txt`).

8. To which party did President Polk belong?

9. Was President Garfield a democrat?

10. Was President Cleveland a democrat?

11. How many presidents belonged to the Republican party? (simply list them and count)

   Once more, edit the `presidents.pl` file and define a rule for `followed(Pres1, Pres2)` that can be used to find presidents in adjacent terms (use your previously defined rules). This predicate should be true if `Pres2` succeeded `Pres1`. After you reload the file in the interpreter, use your new rule to answer these questions (again, copying all queries and answers into `hw06-i-answers.txt`).

12. Who followed President Kennedy?

13. Who preceded President Kennedy?

### Step 4

Add your name, email address, VUnetID, and honor statement to the top of your `errors.pl` file, your `presidents.pl` file, and your `hw06-i-answers.txt` file.

As reminder, this assignment **does not** have a Travis component to it. You **do not** need to enable Travis.