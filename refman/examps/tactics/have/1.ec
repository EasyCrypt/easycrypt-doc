lemma X :
  forall (x : bool), ((x => false) => false) => x.
proof.
move=> x notnot_x.
dump "1-1" (cut excl_or : x \/ (x => false)).
  smt.
case excl_or=> //.
qed.
