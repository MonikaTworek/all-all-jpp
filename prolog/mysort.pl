% mysort.pl

mysort(IN, OUT) :-
	freeze(IN,
	       (   IN = [H | IN_]
	       ->  filter(H, IN_, OUT1, IN2, OUT),
		   mysort(OUT1, IN2)
	       ;   OUT = [])).

filter(Acc, IN1, OUT1, IN2, OUT2) :-
	freeze(IN1,
	       (   IN1 = [H | IN1_]
	       ->  (   H >= Acc
		   ->  OUT1 = [H | OUT1_],
		       filter(Acc, IN1_, OUT1_, IN2, OUT2)
		   ;   OUT1 = [Acc | OUT1_],
		       filter(H, IN1_, OUT1_, IN2, OUT2))
	       ;   OUT1 = [],
		   OUT2 = [Acc | IN2])).
