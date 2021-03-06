require import Bool.

pred P : bool & bool.
pred Q : bool & bool & bool.

lemma L (x y : bool) :
  x \/ y =>
  (x => forall (z : bool), P x z) =>
  (y => forall (z w : bool), Q y z w) =>
  (forall (z : bool), P x z) \/
  (forall (z w : bool), Q y z w).
proof.
dump "6-1" (move=> [Hx HP _ | Hy _ HQ]).
left; apply HP=> //.
right; apply HQ=> //.
qed.
