lemma X :
  forall (x y z : bool),
  (x /\ y => z) <=> (x => y => z).
proof.
dump "1-1" (progress).
smt.
qed.

