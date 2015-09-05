require import Int.

lemma L :
  forall (x y : int), x = y => forall (z : int), y = z => x = z.
proof.
dump "tactics-introduction2-1" (move=> ? ? H1 ? H2).
