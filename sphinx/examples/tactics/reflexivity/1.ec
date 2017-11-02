lemma X (y : bool) :
  (fun x => !x) y = !y.
proof.
dump "1-1" (reflexivity).
qed.
