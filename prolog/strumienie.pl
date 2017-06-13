% strumienie.pl

main(N) :-
	drukowanie(S1),
	podwajanie(S2, S1),
	gen(1, N, S2).

gen(I, N, OUT) :-
	(   I =< N
	->  OUT = [I | OUT_],
	    I1 is I + 1,
	    gen(I1, N, OUT_)
	;   OUT = []).

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

