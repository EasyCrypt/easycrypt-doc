lemma X (x y z : bool) :
  (x /\ y => z) <=> (x => y => z).
proof.
dump "1-1" (split; last first).
trivial.
move=> noncurry tr_x tr_y.
apply noncurry.
split; assumption.
qed.
