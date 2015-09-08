lemma X (x y z w : bool) :
  (((x /\ y) /\ z) /\ w) \/
  ((x /\ (y /\ z)) /\ w) =>
  w.
proof.
dump "1-1" (do! case).
trivial.
trivial.
qed.
