require import Int.

lemma Y (x y x' y' : int) (f : int -> int -> int) :
  x = x' - 2 => y = y' + 2 =>
  f (x + 1) (y - 1) = f (x' - 1) (y' + 1).
proof.
move=> eq_xx' eq_yy'.
dump "1-1" (congr).
smt.
smt.
qed.
