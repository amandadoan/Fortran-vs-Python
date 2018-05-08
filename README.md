# Fortran-vs-Python

This repository contains the implementations of two case studies, each written in two different languages: Fortran and Python. The point of this is to explore how a languages' design decisions shape the way we implement code. To do this, I first did a thorough study of the languages to build a fundamental understanding of each one. Next, I found an example for each language that I felt highlighted important features of each language. Because I am focusing on the intrinsic features of the language, I am not using outside libraries other than the ones for printing. Then, I implemented the examples in both languages and compared my implementations, specifically noting my design choices. Each implementation should feel idiomatic and natural in its language. 

Note, this language excursion is not a full-fledge examination of all the features of the languages. Instead, I focus on only one main feature for each language. As I continue to learn both languages, I will add more examples to this repository, and I welcome anyone to contribute code that highlights and compares cool features between the languages!

Disclaimer: I'm not "fluent" in either languages and am heavily relying on examples and documentations, so I may have misinterpreted them.

## Fortran

Fortran is a procedural programming language that is widely used in the scientific computing community. Procedural programming is a programming paradigm that contains a series of procedures or routines to be carried out. The name, Fortran, itself stands for "Formula Translation" and it was designed specifically for the solution of complex, numerically challenging problems. 

The version I specifically looked at was Fortran90, which is indicative of the year it was related (1990). I chose to study this language, and this specific version, because it is heavily used in the field of High Performance Computing and has a lot of support for parallel and distributed systems. And legacy code. :)

Because of the design of the language and based on how I've seen Fortran programmers structure their code, a programmer can often tell, simply by looking at the names, arguments, and return types of procedures (and related comments), what a particular procedure is supposed to do, without necessarily looking at the details of how it achieves its result. This greatly influenced the way I wrote my code in Fortran. I think that Fortran also enforcing code blocks to have an explicit beginning (name) and explicit end (end name) lends a hand to the procedural aspect of the language. There was a clearly articulated beginning and end for each block.

One thing I wish I got to spend more time on (that I probably will add very soon) is the built-in array handling features of the language. It contains primitive data types for matrix and complex objects which permit the user to perform matrix manipulations and computations without having to deal with the individual components. For example:
```
A = (/ i , i = 1,100 /)
B = 3.24*A
C = matmul(A,B) ! You can perform a matrix mult. using a built-in function
B = exp(A)
norm = sqrt(sum(A**2))
```
Fortran allows whole array operations and also operations on array sections. Instead of focusing on the matrix at an element-level, the programmer could focus on the matrix at an array-level. It thus becomes easy to scale up a program for parallel processing. Also, almost all of the intrinsic functions in Fortran (Sin(), Exp(), Abs(), Floor(), etc) can take arrays as arguments, leading to easy of use and very neat code.

In Fortran, the compiler can load the matrix values once and store them in registers. It can do so because the Fortran compiler assumes pointers/arrays do not overlap in memory due to its lack of aliasing. Also, because pointers are restricted in such a way that it's immediately obvious if there might be aliasing, and so the optimizer can go to town on your code. In computer programming, aliasing refers to the situation where the same memory location can be accessed using different names.

If your application doesn't fall under scientific, engineering, or number crunching in general, then neither of the above will be a big deal for you, so you may want to look elsewhere. Fortran has been highly optimized for mathematical (especially matrix) like operations, so much so that these optimizations are built into the foundation of the language, rather than a library.

My experience with Fortran is that it's easy to learn, clean (being highly modularized), and thus well suited to a non-programmer whose main concern is doing highly optimized numerical computations. When it comes to matrix calculations, out-of-the box a Fortran compiler works amazingly. I'd also add that Fortran has keywords that are specifically designed to help the programmer to squeeze more performance out of a numerical routine.

## Python

Python is an interpreted high-level programming language for object-oriented programming. Object-oriented programming is a programming language model organized around objects rather than "actions" and data rather than logic. 

Although I treated it as an object-oriented language, the syntax of the language made coding in both paradigms very easy. However, unlike Fortran, there weren't any built-in functions that allowed for numerical computations. There are, however, libraries like numpy that support these features, but they are not embedded into the language itself. Luckily, there is a strong Python community that provide a lot of unofficial documentations, tutorials, and support on stackoverflow (my best friend).

## Comparison Between Both Language

Imperative programming is a programming paradigm that uses statements that change a program's state, focusing on describing how a program operates. From this stems the paradigms I focused on in this project, procedural and object-oriented.

One could argue that Fortran is now an object-oriented programming langauge, as well, because of the addition of objects, pulymorphism, and other related features added to Fortran03, but my project uses Fortran90, so for these purposes I will continue to view it as a procedural programming language.

Fortran has both subroutines and functions, while Python only have functions. A Fortran function is similar to a mathematical function, which takes one or many parameters as inputs and returns a single output value. A Fortran subroutine is a block of code that performs some operation on the input variables, and as a result of calling the subroutine, the input variables are modified. In Python, functions don't technically need to return anything, so it might be safe to say that a Python function acts as a Fortran subroutine and function.

As for objects, in Fortran, modules may contain data, but there is no notion of separate instances of a module. In order to obtain class-like behavior like in Python, you can combine a module, which contains the methods that operate on the class, with a derived type containing the data. There can be separate “instances” of the type in that we can allocate many variables of that type which can be passed as parameters to the methods contained in the module.

## Example 1: Gaussian Elimination
In linear algebra, Gaussian elimination (also known as row reduction) is an algorithm for solving systems of linear equations. It is usually understood as a sequence of operations performed on the corresponding matrix of coefficients. This method can also be used to find the rank of a matrix, to calculate the determinant of a matrix, and to calculate the inverse of an invertible square matrix.

## Example 2: Circle Class
This is a simple implementation of a circle class that has a radius attribute and a method to calculate and print the area.
[This](http://www.cs.rpi.edu/~szymansk/OOF90/F90_Objects.html) is the link I used to implement the Circle Class in Fortran using an object-oriented style.

## How To Run The Code
I am using Ubuntu Linux 16.04. After cloning from git, the following commands can be copied and pasted in the terminal to execute the programs.

### Fortran
(Example 1)
```
gfortran GaussianElimination.f90 -o GaussianElimination
./GaussianElimination
```

(Example 2)
```
gfortran CircleClass.f90 -o CircleClass
./CircleClass
```

### Python
(Example 1)
```
python ./GaussianElimination.py
```

(Example 2)
```
python ./CircleClass.py
```

# Conclusion

In conclusion, it really depends on what problem you're trying to solve, the skills you have, and the people you work with.

Fortran has great built-in array processing features. If your problem can be described in terms of simple data structures and in particular arrays, Fortran is well adapted. Fortran programmers end up using arrays even in non-obvious cases (e.g. for representing graphs). Python is better suited for dynamic data structures. It also might take more programming experience to write good Python programs than to write good Fortran programs. I felt like procedural programming was very intuitive, where object-oriented programming required one to rethink the way they problem-solved.

However, Fortran is domain-specific and not everything can be fitted into a numerical computation problem. In general, I would say Python was the easiest to pick up and code with. Although I tried to treat it as purely an object-oriented programming language, its features allowed it to be more of a general-purpose programming language and could be applied to many different paradigms, including procedural. This is why the Python code was easy to code up and still look like Python-style code.

This is final project assignment for COMP 394 Programming Languages at Macalester College, and also a fun project for myself to explore two languages that are heavily used in High Performance Computing (HPC), a field that I am greatly interested in.

# Future Work
In this project, I approached the first example as a "procedural paradigmed" example and the second example as an "object-oriented paradigmed" example.  What I would like to see is each example implemented in the "flavor" of the language it was written in. For example, it would have been interesting to see how Gaussian Elimination would have looked in an object-oriented way.
