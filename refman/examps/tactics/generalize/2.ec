require import Int.

lemma L :
  forall (x y : int), x = y => y = x.
proof.
move=> x y H1.
dump "2-1" (generalize y x H1).
