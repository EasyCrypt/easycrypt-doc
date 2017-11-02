require import Int.

lemma L :
  forall (x y : int), x = y => y = x.
proof.
move=> x y eq_xy.
dump "2-1" (move: x eq_xy).
