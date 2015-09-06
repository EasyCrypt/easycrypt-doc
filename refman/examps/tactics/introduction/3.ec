require import Int.

lemma L :
  forall (x y : int), x = y => forall (z : int), y = z => x = z.
proof.
dump "3-1" (move=> x! x! eq! x! eq!).
