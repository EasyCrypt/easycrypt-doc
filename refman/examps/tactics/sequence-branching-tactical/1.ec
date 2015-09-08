lemma X (x y z : bool) :
  (x /\ y) /\ z => x /\ (y /\ z).
proof.
(case; case) => tr_x tr_y tr_z.
dump "1-1" (split; [assumption | split; assumption]).
qed.
