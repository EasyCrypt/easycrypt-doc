require import Int.

lemma L :
  forall (x y : int), x = y => forall (z : int), y = z => x = z.
proof.
move=> x y.
dump "tactics-introduction4-1" (move=> ->).
trivial.
qed.
