require import Int.

lemma X (x y : int) :
  y - 1 = x =>
  x = y + 1 \/ y = x + 1.
proof.
move=> eq_yz.
dump "1-1" (right).
smt.
qed.
