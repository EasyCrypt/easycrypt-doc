type tree = [Leaf | Node of bool & tree & tree].

lemma X :
  forall (p : tree -> bool) (tr : tree),
  p Leaf =>
  (forall (b : bool) (tr1 tr2 : tree),
   p tr1 => p tr2 => p(Node b tr1 tr2)) =>
  p tr.
proof.
move=> p tr basis indstep.
move: tr.
dump "1-1" 65 (elim).
apply basis.
apply indstep.
qed.
