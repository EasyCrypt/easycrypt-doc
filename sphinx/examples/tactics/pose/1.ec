require import Int.

lemma X (x y : int) :
  2 * (((x + 1) + y) * x) =
  ((x + 1) + y) * x +
  ((x + 1) + y) * x.
proof.
dump "1-1" (pose z := (_ + y) * _).
smt.
qed.
