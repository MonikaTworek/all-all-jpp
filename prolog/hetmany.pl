% hetmany.pl

:- use_module(library(clpfd)).

hetmany_gt(N, P) :-
	numlist(1, N, X),
	permutation(X, P),
	\+ niebezpieczna(P).

niebezpieczna(P) :-
	append(_, [I | L1], P),
	append(L2, [J | _], L1),
	length(L2, K),
	abs(I-J) =:= K + 1.

hetmany(N, P) :-
	length(P, N),
	P ins 1..N,
	bezpieczna(P),
	labeling([ffc], P).

bezpieczna([]).
bezpieczna([I | L]) :-
	bezpieczna(L, I, 1),
	bezpieczna(L).

bezpieczna([], _, _).
bezpieczna([J | L], I, K) :-
	I #\= J,
	abs(I-J) #\= K,
	K1 is K+1,
	bezpieczna(L, I, K1).

