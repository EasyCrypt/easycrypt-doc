require import Int.

lemma L :
  forall (x y : int), x = y => forall (z : int), y = z => x = z.
proof.
move=> x y eq_xy z eq_xz.
dump "2-1" (rewrite - eq_xy in eq_xz).
assumption.
qed.
