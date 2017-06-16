% strumienie.pl

main(N) :-
	drukowanie(S1),
	podwajanie(S2, S1),
	numlist(1, N, S2).

podwajanie(IN, OUT) :-
	freeze(IN,
	       (   IN = [H | IN_]
	       ->  H2 is 2 * H,
		   OUT = [H2 | OUT_],
		   podwajanie(IN_, OUT_)
	       ;   OUT = [])).

drukowanie(IN) :-
	freeze(IN,
	       (   IN = [H | IN_]
	       ->  writeln(H),
		   drukowanie(IN_)
	       ;   true)).

