lemma PairEq ['a, 'b] :
  forall (x x' : 'a) (y y' : 'b),
  x = x' => y = y' => (x, y) = (x', y').
proof.
dump "tactics-examp0-1" (intros x x' y y').
dump "tactics-examp0-2" (intros H1 H2).
dump "tactics-examp0-3" (rewrite H1 H2).
dump "tactics-examp0-4" (reflexivity).
qed.
