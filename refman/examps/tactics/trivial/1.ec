require import Int.

lemma X :
  forall (x y : int),
  x = y => y - 1 = x - 1.
proof.
dump "1-1" (trivial).
qed.
