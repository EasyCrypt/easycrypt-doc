lemma X :
  forall (x y z w : bool),
  y = x => y = z => z = w =>
  x = w.
proof.
move=> x y z w eq_yx eq_yz eq_zw.
dump "2-1" (subst).
reflexivity.
qed.
