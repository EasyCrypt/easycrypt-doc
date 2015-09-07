require import Int.

lemma M (x y : int) :
  x = y => x = y.
proof.
move=> eq_xy.
dump "1-1" (assumption).
qed.
