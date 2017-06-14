:- dynamic fib/2.

fib(0, 0).
fib(1, 1).
fib(N, F) :-
	N > 1,
	N1 is N-1,
	N2 is N-2,
	fib(N1, F1),
	fib(N2, F2),
	F is F1+F2,
	asserta(fib(N, F)).

fib(0).
fib(1).
fib(X) :-
	fib(0, 1, X).

fib(A, B, X) :-
	S is A + B,
	(   X = S
	;   fib(B, S, X)).


