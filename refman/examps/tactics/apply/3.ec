require import Int.
pred P : int.
pred Q : int.
pred R : int.
axiom P (x : int) : P x.
axiom Q (x : int) : P x => Q x.
axiom R (x : int) : P(x + 1) => Q x => R x.

lemma X (x : int) : R x.
proof.  
dump "3-1" (apply /R /Q /P /P).
qed.
