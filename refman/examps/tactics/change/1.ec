lemma X :
  forall (x y z : bool),
  (y => z) =>
  x => (x <=> (y => x /\ z)).
proof.
move=> + y z imp_yz.
case.
dump "1-1" (change (y => z)).
assumption.
trivial.
qed.
