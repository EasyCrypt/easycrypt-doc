require import Int.

lemma X (x y : int) :
  x = y <=> x - 1 = y - 1.
proof.
dump "1-1" (split).
trivial.
smt.
qed.
