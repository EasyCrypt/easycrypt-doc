require import Int.

lemma L :
  forall (x y : int), x = y => forall (z : int), y = z => x = z.
proof.
move=> x y H1 z.
dump "8-1" (move=> ->>).
assumption.
qed.
