require import Int.

lemma X :
  (exists (x : int), 0 < x < 5) =>
  (exists (x : int), 5 < x < 10).
proof.
dump "4-1" (case).
move=> x rng_x.
exists (x + 5).
smt.
qed.

