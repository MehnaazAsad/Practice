% Name: Mehnaaz Asad
% Email: mehnaaz.asad@vanderbilt.edu
% VUnetID: asadm2
% Honor statement: I pledge to pursue all academic endeavors with honor and integrity.
% I understand the principles of the Honor System, and I promise to
% uphold these standards by adhering to the Honor Code in order to
% preserve the integrity of Vanderbilt University and its individual
% members.

%  data supplied with assignment:
parent(a, b).  % 1
parent(a, c).  % 2
parent(b, d).  % 3
parent(b, e).  % 4
parent(c, f).  % 5
parent(d, g).  % 6
parent(d, h).  % 7
parent(d, i).  % 8

% Part 1
sibling(X,Y) :- parent(Parent1,X),parent(Parent1,Y),not(X=Y).
cousin(X,Y) :- parent(Parent1,X),parent(Parent2,Y),
    sibling(Parent1,Parent2).
grandchild(X,Y) :- parent(Parent1,X),parent(Y,Parent1),not(X=Y).
descendant(X,Y) :- parent(Y,X);(parent(Parent1,X),descendant(Parent1,Y)).

% Part2
% Q1
member2(X, [X|_]).
member2(X, [_|L]) :- member2(X,L).

%Q2
subset2([L|Tail],K) :- member2(L,K),subset2(Tail,K).
subset2([],_).

%Q3
disjoint2([L|Tail],K) :- not(member2(L,K)),disjoint2(Tail,K).
disjoint2([],_).


%Q4 (Extra credit version)
union2([],K,K).
union2([L|Tail],K,M) :- member2(L,K),union2(Tail,K,M).
union2([L|Tail],K,[L|M]) :- not(member2(L,K)),union2(Tail,K,M).

%Q5
intersection2([],_,[]).
intersection2([L|Tail],K,[L|M]) :- member2(L,K),intersection2(Tail,K,M).
intersection2([L|Tail],K,M) :- not(member2(L,K)),intersection2(Tail,K,M).


%Q6
reverse2Acc([],Acc,Acc).
reverse2Acc([Head|Tail],L2,Acc) :- reverse2Acc(Tail,L2,[Head|Acc]).
reverse2(L1,L2) :- reverse2Acc(L1,L2,[]).

%Q7
flatten2Acc([],Acc,Acc).
flatten2Acc([Head|Tail],L2,Acc) :- is_list(Head),union2(Acc,Head,Acc2),flatten2Acc(Tail,L2,Acc2).
flatten2(L1,L2) :- flatten2Acc(L1,L2,[]).


%Step 3
%Q1
sumAcc([],Acc,Acc).
sumAcc([Head|Tail], Result,Acc) :- Acc2 is Acc + Head, sumAcc(Tail,Result,Acc2).
sumlist2(L,N) :- sumAcc(L,N,0).

%Q2
occurAcc(_,[],0).
occurAcc(X,[Head|Tail],Acc) :- Head=X, Acc2 is Acc - 1, occurAcc(X,Tail,Acc2).
occurAcc(X,[Head|Tail],Acc) :- not(Head=X) , occurAcc(X,Tail,Acc).
occurences(X,L,N) :- occurAcc(X,L,N).

%Q3
occursAcc([Head|_],0,X) :- Head=X.
occursAcc([_|Tail],Acc,X) :- Acc2 is Acc - 1, occursAcc(Tail,Acc2,X).
occurs(L,N,X) :- occursAcc(L,N,X).
