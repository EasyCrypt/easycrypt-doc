require import Int.

lemma M :
  forall (x y z : int),
  x = y => y = z => x - 1 = y - 1.
proof.
move=> x y z eq_xy eq_yz.
dump "1-1" (clear z eq_yz).
