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
dump "7-1" (case=> [Hx HP X | Hy X HQ] {X}).
left; apply HP=> //.
right; apply HQ=> //.
qed.
