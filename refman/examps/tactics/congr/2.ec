require import Int.

lemma Y (x y x' y' : int) :
  x = x' - 2 => y = y' + 2 =>
  (x + 1) + (y - 1) = (x' - 1) + (y' + 1).
proof.
move=> eq_xx' eq_yy'.
dump "2-1" (congr).
smt.
smt.
qed.
