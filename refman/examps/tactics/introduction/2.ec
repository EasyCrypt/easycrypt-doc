require import Int.

lemma L :
  forall (x y : int), x = y => forall (z : int), y = z => x = z.
proof.
dump "2-1" (move=> ? ? ? ? ?).
