lemma X :
  forall (x y : bool * bool),
  x <> y => x.`1 <> y.`1 \/ x.`2 <> y.`2.
proof.
dump "6-1" 60 (case).
move=> x1 x2.
case=> y1 y2 neq /=.
smt.
qed.
