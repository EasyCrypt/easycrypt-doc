lemma PairEq ['a, 'b] :
  forall (x x' : 'a) (y y' : 'b),
  x = x' => y = y' => (x, y) = (x', y').
proof.
dump "tactics-examp0-1" (move=> x x' y y').
dump "tactics-examp0-2" (move=> eq_xx' eq_yy').
dump "tactics-examp0-3" (rewrite eq_xx' eq_yy').
dump "tactics-examp0-4" (reflexivity).
qed.
