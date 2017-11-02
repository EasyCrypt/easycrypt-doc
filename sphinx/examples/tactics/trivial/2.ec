lemma X :
  forall (x y z : bool),
  (x /\ y => z) <=> (x => y => z).
proof.
dump "2-1" (trivial).
smt.
qed.
