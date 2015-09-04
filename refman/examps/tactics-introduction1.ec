require import Int.

lemma L :
  forall (x y : int), x = y => forall (z : int), y = z => x = z.
proof.
dump "tactics-introduction1-1" (move=> x y H1 z H2).
