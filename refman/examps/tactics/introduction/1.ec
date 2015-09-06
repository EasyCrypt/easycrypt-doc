require import Int.

lemma L :
  forall (x y : int), x = y => forall (z : int), y = z => x = z.
proof.
dump "1-1" (move=> x y eq_xy z eq_yz).
