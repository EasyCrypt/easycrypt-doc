require import Int.

lemma X (x y z w : int) :
  x = z + 9 =>
  y = w - 12 =>
  (x - 7, 2 + y) = (z + 2, w - 10).
proof.
move=> eq_xz eq_yw.
dump "3-1" (split).
smt.
smt.
qed.

