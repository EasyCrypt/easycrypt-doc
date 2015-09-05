require import Int.

lemma L :
  forall (x y : int), x = y => y = x.
proof.
move=> x y.
dump "3-1" (generalize {2} y {2} x).
