type tree = [Leaf | Node of bool & tree & tree].
op rev (tr : tree) : tree =
  with tr = Leaf => Leaf
  with tr = Node b tr1 tr2 => Node b (rev tr1) (rev tr2).

lemma IndPrin :
  forall (p : tree -> bool) (tr : tree),
  p Leaf =>
  (forall (b : bool) (tr1 tr2 : tree),
   p tr1 => p tr2 => p(Node b tr1 tr2)) =>
  p tr.
proof.
move=> p tr basis indstep.
move: tr.
elim.
apply basis.
apply indstep.
qed.

lemma RevRev :
  forall (t : tree), rev(rev t) = t.
proof.
dump "2-1" (elim /IndPrin).
trivial.
move=> b tr1 tr2 IH1 IH2.
simplify.
split; [apply IH1 | apply IH2].
qed.


