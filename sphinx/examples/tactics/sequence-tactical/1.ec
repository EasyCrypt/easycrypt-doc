lemma X (x y z : bool) :
  (x /\ y) /\ z => x /\ (y /\ z).
proof.
dump "1-1" (case; case).
trivial.
qed.
