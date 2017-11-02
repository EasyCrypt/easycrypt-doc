require import Int.

lemma L :
  forall (x y : int), x = y => forall (z : int), y = z => x = z.
proof.
move=> x y eq_xy.
dump "1-1" (rewrite eq_xy).
dump "1-2" (rewrite - {1} eq_xy).
dump "1-3" (rewrite - eq_xy).
trivial.
qed.
