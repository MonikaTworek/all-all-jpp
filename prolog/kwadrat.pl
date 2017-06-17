% kwadrat.pl

:- use_module(library(clpfd)).

main(Xs) :-
	kwadraty(112,
		 [50,42,37,35,33,29,27,25,24,19,18,17,16,15,11,9,8,7,6,4,2],
		 Xs).

kwadraty(D, Ds, Xs) :-
        length(Ds, N),
        D1 is D-1,
        length(Xs, N),
        Xs ins 0..D1,
	length(Ys, N),
	Ys ins 1..D,
        zadania(Xs, Ys, Ds, Zadania),
        cumulative(Zadania, [limit(D)]),
	% SICStus Prolog z opcją global(true) w cumulative/2 8500ms
        labeling([ffc], Xs).

zadania([], [], [], []).
zadania([X | L1], [Y | L2], [D | L3], [task(X, D, _, D, _) | L4]) :-
	Y #= X + D,
        zadania(L1, L2, L3, L4).

