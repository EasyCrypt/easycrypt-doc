lemma X :
  forall (x y : bool),
  (x <=> y) => x = y.
proof.
dump "5-1" (case).
case=> //.
case=> //.
qed.
