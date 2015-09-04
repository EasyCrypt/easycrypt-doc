require import Int.

lemma L :
  forall (x y : int), x = y => forall (z : int), y = z => x = z.
proof.
dump "tactics-introduction3-1" (move=> x! x! H1 x! H2).
