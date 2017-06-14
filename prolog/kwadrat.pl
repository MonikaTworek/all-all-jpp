% kwadrat.pl

:- use_module(library(clpfd)).

main(Xs) :-
	kwadraty(112,
		 [50,42,37,35,33,29,27,25,24,19,18,17,16,15,11,9,8,7,6,4,2],
		 Xs).

kwadraty(D, Sqs, Xs) :-
        length(Sqs, N),
        D1 is D-1,
        length(Xs, N),
        Xs ins 0..D1,
        length(Ys, N),
        Ys ins 1..D,
        zadania(Xs, Ys, Sqs, 1, T1),
        cumulative(T1, [limit(D)]),
	% SICStus Prolog z opcją global(true) w cumulative/2 8500ms
        labeling([ffc], Xs).


zadania([], [], [], _, []).
zadania([X | L1], [Y | L2], [D | L3], T, [task(X, D, Y, D, T) | L4]) :-
        Y #= X + D,
        T1 is T + 1,
        zadania(L1, L2, L3, T1, L4).
