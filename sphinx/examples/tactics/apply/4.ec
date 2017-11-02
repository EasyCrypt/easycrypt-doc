require import Int.
pred P : int.
pred Q : int.
pred R : int.
axiom P (x : int) : P x.
axiom Q (x : int) : P x => Q x.
axiom R (x : int) : P(x + 1) => Q x => R x.

lemma X (x : int) : P(x + 1) => Q x => R x.
proof.  
move=> HP.
dump "4-1" (apply R in HP).
assumption.
qed.
