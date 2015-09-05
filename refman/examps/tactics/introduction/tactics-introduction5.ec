require import Int.

lemma L :
  (forall (u v : int), u = v => v = u) =>
  forall (x y : int), x = y => forall (z : int), y = z => x = z.
proof.
move=> Sym x y.
dump "tactics-introduction5-1" (move=> /Sym).
dump "tactics-introduction5-2" (move=> ->).
trivial.
qed.
