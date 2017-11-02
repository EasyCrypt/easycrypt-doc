lemma X :
  forall (x y z w : bool),
  y = x => y = z => z = w =>
  x = w.
proof.
move=> x y z w eq_yx eq_yz eq_zw.
dump "1-1" (subst x).
dump "1-2" (subst y).
dump "1-3" (subst z).
reflexivity.
qed.
