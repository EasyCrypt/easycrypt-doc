require import Int.

lemma X (x y : int) :
  x - 1 = y =>
  x = y + 1 \/ y = x + 1.
proof.
move=> eq_xy.
dump "1-1" (left).
smt.
qed.
