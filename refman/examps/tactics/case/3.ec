require import Int.

lemma X (x y : int) :
  x < y \/ y < x => x - y <> 0.
proof.
dump "3-1" (case).
smt.
smt.
qed.
