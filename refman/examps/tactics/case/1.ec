require import Int.

lemma X (x y : int) :
  `|x - y| <= 10 =>
   x - y <= 10 \/ y - x <= 10.
proof.
move=> abs_bnd.
dump "1-1" (case (x <= y)).
move=> lte_xy; right; smt.
move=> lte_xy; left; smt.
qed.
