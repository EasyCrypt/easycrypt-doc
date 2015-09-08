require import Int.

lemma X (x y z : int) :
  x = y /\ y = z => x = z.
proof.
dump "2-1" (case).
trivial.
qed.
