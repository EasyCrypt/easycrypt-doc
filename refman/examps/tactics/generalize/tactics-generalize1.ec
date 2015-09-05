require import Int.

lemma L :
  forall (x y : int), x = y => y = x.
proof.
move=> x y.
dump "tactics-generalize1-1" (generalize (y = x)).
