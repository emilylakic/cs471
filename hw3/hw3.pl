 /* Homework Assignment 3
   Programming Languages
   CS471, Spring 2020
   Due Tuesday, Feb 11
   Binghamton University */

%%%% Homework %%%%

/* Problem 1:
   A) What is the mathematical definition of:
     a) a relation?
     b) a function?
   B) Is every function a relation? If false, give a counter example.
   C) Is every relation a function? If false, give a counter example. */

/* Problem 1 Answer:
   A) What is the mathematical definition of:
     a) a relation?
     A relation is defined as two things. A domain. And a set of ordered pairs where both elements are from the domain (Those elements are related).

     b) a function?
     A function is defined as three things. A domain. A range. And a rule that assigns one element from the range to each element from the domain.

   B) Is every function a relation? If false, give a counter example.
   True. Every function is a relation.

   C) Is every relation a function? If false, give a counter example.
   False. Not every relation is a function. If your set is {0,1}, and the relation is (0,1),(0,0),(1,0) and (1,1), then any two elements are related. That relation can’t be a function because f(0) is one value, it can not be both 0 and 1.*/

/* Problem 2:
   Define homoiconic.
   Is Prolog homoiconic?
   What does it mean to say a language is fully reflective?
   Is Prolog fully reflective?

   (See page 584 and Chapter 12)
*/

/* Problem 2 Answer: */
/*
 Define homoiconic.
   A language is homoiconic if a program written in it can be manipulated as data using the language, and thus the program's internal representation can be inferred just by reading the program itself.

Is Prolog homoiconic?
   Yes, Prolog is homoiconic. A Prolog program is itself a sequence of Prolog terms that can be read, manipulated and evaluated using built-in mechanisms.

What does it mean to say a language is fully reflective?
   If a language is fully reclective, the language has a static type system and allows types and code to be manipulated dynamically, hence giving it full reflection over the structure of a program.
   Source used: Towards a Fully-Reflective Meta-Programming Language Paper by G. Neverov

Is Prolog fully reflective?
   Yes, Prolog is fully reflective. Separate databases can be handled as first‐class objects. Different forms of database combination such as inheritance and dynamic context extension & contraction are specified and implemented in a dynamic and flexible way through reflection.
   (See page 584 and Chapter 12)
*/

/* Problem 3:

The following are two basic predicates for list manipulation:
my_first/2 and my_last/2. We may refer to a predicate by writings it
as name/arity; hence, my_first/2 means a predicate named my_first with
two arguments.

my_first(X,Y) succeeds if X is the first element of list Y.
my_last(X,Y) succeeds if X is the last element of list Y.
*/

my_first(X,[X|_T]).

my_last(X,[X]).
my_last(X,[_H|Ys]) :- my_last(X,Ys).

/*
Note my use of the _ (wildcard). It is used to say to Prolog "I don't
care, match anything" and should be used to avoid singleton warnings
(a variable that is not unified). We will discuss this during lab.

Try the following queries before moving on. Note that they are
included in the comment section for a reason: They would be
interpreted as facts in the database otherwise.

my_first(X,[3,a,dd]).
my_last(X,[3,a,dd]).
my_first(3,[3,a,dd]).
my_first(a,[3,a,dd]).
my_last(dd,[3,a,dd]).
my_last(a,[3,a,dd]).

Now, write a predicate has_item(X,Y) that succeeds if X is a item in the list Y.

NOTE: my_first/2 and my_last/2 are provided as examples for
manipulating lists. You should not use them in definition of
has_item/2.

*/

/* Problem 3 Answer: */

has_item(X, [X | _]).
has_item(X, [_ | Y]) :- has_item(X, Y).

/* Problem 3 Test: */
%:- has_item((1,3),[(1,2),(1,3)]).     % SUCCEED
%:- has_item(3,[3]).                   % SUCCEED
%:- has_item((1,3), [(2,1),(3,1)]).     % FAIL

/* Problem 4:
 Write a predicate init(All, BLst) that succeeds if Blst has all the items of ALL
 except the last item.  The items in BLst are in the same order as ALL.
*/

/* Problem 4 Answer: */

init([_], []).
init([E|X], [E|Y]) :- init(X, Y).

/* Problem 4 Test: */
% :- init([1], []).       % SUCCEED
% :- init([1,2,3], [1,2]). % SUCCEED
% :- init([1,2], [1,2]).  % FAIL
% :- init([1,2], [2]).	% FAIL
/*% is a comment in prolog. When you want to test then uncomment the % and check that :- is working*/

/* Problem 5:
Write a predicate is_decreasing(X) that succeeds if X is a list of decreasing numbers -- Each number is either the same or lower than the preceding number.

NOTE: You may match two elements at a time against a list: [X,Y|Xs] = List. It's preferable to do it in the rule head however...
some_rule([X,Y|Xs]) :- ...  */

/* Problem 5 Answer: */

is_decreasing([]).
is_decreasing([_]).
is_decreasing([X, Y | Xs]) :- X >= Y, is_decreasing([Y | Xs]).

/* Problem 5 Test: */
%:- is_decreasing([]).            % SUCCEED
%:- is_decreasing([10]).          % SUCCEED
%:- is_decreasing([10,9]).        % SUCCEED
%:- is_decreasing([10,9,7]).      % SUCCEED
%:- is_decreasing([10,9,7,7,2]).  % SUCCEED
%:- is_decreasing([1,1,1,1,1]).   % SUCCEED

%:- is_decreasing([10,9,7,9]).    % FAIL
%:- is_decreasing([2,3,1]).       % FAIL
%:- is_decreasing([1,2,3]).       % FAIL
%:- is_decreasing([7,19]).        % FAIL

/* Problem 6:
Write a predicate element_at(X,Y,N) that succeeds if X is the Nth element of list Y. Y is 0-indexed.

NOTE: Don't worry about the error cases: i.e, N greater than the length of Y.  */

/* Problem 6 Answer: */

element_at(X,[X|_],0).
element_at(X,[_|T],N) :- Y is N-1, element_at(X,T,Y).

/* Problem 6 Test: */
%:- element_at(3,[1,2,3],2).   % SUCCEED
%:- element_at(1,[1,2,3],0).   % SUCCEED

%:- element_at(1,[1,2,3],1).     % FAIL


/* Problem 7 :
Write a predicate delete_at(E,Y,N,Z) that succeeds if Z is the list Y with E delete at index N -- Delete E at index N in Y.
YOU SHOULD USE the predicate defined in 0D problem in lab to solve this problem.

NOTE: Don't worry about the error cases: i.e, N greater than the length of Z.  */

/* Problem 7 Answer: */

delete_at(X,[X|F],0,F).
delete_at(X,[H|T],N,[H|Z]):- Y is N-1, delete_at(X,T,Y,Z).

/* Problem 7 Test: */

%:- delete_at(3,[1,2,3,3],2,[1,2,3]).  % SUCCEED
%:- delete_at(1,[1,1,2,3],0,[1,2,3]).  % SUCCEED
%:- delete_at(a,[1,a,2,3],1,[1,2,3]).  % SUCCEED

%:- delete_at(1,[1,2,3],0,[1,2,3]).    % FAIL

/* Problem 8:

Write a predicate zip(Xs,Ys,Zs) that succeeds if Zs is a list where each element is a tuple, (X,Y), with Xs and Ys paired together. However, the length of Zs will be equal to the length of Xs or Ys which ever is less.

For example...
zip([1,2,3,4],[a,b,c],Zs) should give Zs = [(1,a),(2,b),(3,c)]
zip([1],[a,b],Zs) should give Zs = [(1,a)] */

/* Problem 8 Answer: */

zip([],[],[]).
zip([_|_],[],[]).
zip([],[_|_],[]).
zip([H1|Xs],[H2|Ys],[(H1,H2)|Zs]) :- zip(Xs,Ys,Zs).

/* Problem 8 Test: */
%:- zip([1,2,3],[a,b,c],[(1,a),(2,b),(3,c)]). % SUCCEED
%:- zip([],[a,b,c],[]).                  % SUCCEED
%:- zip([1,3],[],[]).                    % SUCCEED
%:- zip([1,3],[2],[(1,2)]).              % SUCCEED

%:- zip([1],[2],[(2,3)]).                 % FAIL
%:- zip([1],[a,b],[(1,a),(1,b)]).         % FAIL

/* Problem 9:
Write a predicate merge(A,B,M) that succeed if the list M has all the items from lists A and B in decreasing order.  Assume that A and B are sorted in decreasing order.  Items do not need to be unique.

For example:
merge([10,3,2], [11,5,2], M) should give M =[11,10,5,3,2,2].

 */

/* Problem 9 Answer: */

merge([],[],[]).
merge(X,[],X).
merge([],X,X).
merge([A|B],[H|J],[L|K]) :-
    A >= H, A = L,
    merge(B,[H|J],K);
    H = L,
    merge([A|B],J,K).

/* Problem 9 Test: */
%:- merge([10,3,2],[11,5,2],[11,10,5,3,2,2]).        % SUCCEED
%:- merge([0],[],[0]).                               % SUCCEED
%:- merge([],[3],[3]).                               % SUCCEED

%:- merge([4,3],[3],[3]).                            % FAIL

/* Problem 10:
   See Problem 0B above for the knowledge base used for defining greater_than/2 .
   Exercise  3.4 (http://www.learnprolognow.org/lpnpage.php?pagetype=html&pageid=lpn-htmlse11)
   Define a predicate greater_than/2 that takes two numerals in the notation
   that we introduced in the text (that is, 0, succ(0), succ(succ(0)), and so on)
   as arguments and decides whether the first one is greater than the second one.
*/

/* Problem 10 Answer: */

greater_than(succ(_), 0).
greater_than(succ(X), succ(Y)) :- greater_than(X, Y).

/* Problem 10 Test: */
% :- greater_than(succ(succ(succ(0))),succ(0)).        % SUCCEED
% :- greater_than(succ(succ(0)),succ(succ(succ(0)))).  % FAIL

/* Problem 11:
   See Problem 0B above for the knowledge base used for defining subtract/3 .
   Define substract(Num1,Num2,Result) to succeed if Result is the result of
   Num1 - Num2.  Num1, Num2 and Result use four symbols: 0, succ , and the left and right parentheses
   to represent numbers.

   Use the add/3, from problem 0B, definition to define subtract/3.  Do not
   write a recursive definition for subtract/3.
*/

/* Problem 11 Answer: */

subtract(Num1, Num2, Result) :- add(Num2, Result, Num1).

/* Problem 11 Test: */
% :- subtract(succ(succ(0)), succ(0), succ(0)).       % SUCCEED
% :- subtract(succ(succ(0)), 0, succ(succ(0))).       % SUCCEED
% :- subtract(succ(succ(0)), succ(succ(0)), 0).       % SUCCEED

% :- subtract(succ(succ(0)), 0, 0).	                  % FAIL
% :- subtract(succ(succ(0)), succ(0), succ(succ(0))). % FAIL

/* Problem 12:

Write a predicate has_subseq(X,Y) that succeeds if Y is a list that is a subsequence of a list X.

For example...
has_subseq([a,b,c,d],[b,d]) should succeed, but has_subseq([a,b,c,d],[b,e]) should fail. */

/* Problem 12 Answer */

has_subseq([], []).
has_subseq([H|X], Y) :- has_subseq(X, Y).
has_subseq([H|X], [T|Y]) :- H = T, has_subseq(X, Y).

/* Problem 12 Test: */
%:- has_subseq([a,g,b,d],[g,b]).     % SUCCEED
%:- has_subseq([1,2,3,4],[2,4]).     % SUCCEED
%:- has_subseq([1,2,3,4],[2,3]).     % SUCCEED
%:- has_subseq([1,2,3,4],[]).        % SUCCEED

%:- has_subseq([1,2,3,4],[2,5]).     % FAIL
%:- has_subseq([1,2,3,4],[4,3]).     % FAIL
