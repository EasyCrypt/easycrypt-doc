require import Int.

lemma X (x y z w : int) :
  x = y => z = w =>
  x - 1 = y - 1 && z + 1 = w + 1.
proof.
move=> eq_xy eq_zw.
dump "2a-1" (split).
smt.
smt.
qed.
