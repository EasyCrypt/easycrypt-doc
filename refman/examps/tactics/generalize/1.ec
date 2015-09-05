require import Int.

lemma L :
  forall (x y : int), x = y => y = x.
proof.
move=> x y.
dump "1-1" (generalize (y = x)).
