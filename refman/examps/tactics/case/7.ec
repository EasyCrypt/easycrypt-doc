type tree = [Leaf | Node of bool & tree & tree].

lemma X :
  forall (tr : tree),
  tr = Leaf \/
  exists (b : bool) (tr1 tr2 : tree), tr = Node b tr1 tr2.
proof.  
dump "7-1" 65 (case).
left; reflexivity.
move=> b t t0.
right; exists b; exists t; exists t0; reflexivity.
qed.
