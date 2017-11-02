require import Int.

lemma X :
  (exists (x : int), 0 < x < 5) =>
  (exists (x : int), 5 < x < 10).
proof.
case.
move=> x rng_x.
dump "1-1" (exists (x + 5)).
smt.
qed.
