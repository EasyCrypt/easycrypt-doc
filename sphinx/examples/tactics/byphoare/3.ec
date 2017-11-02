require import Bool DBool Real.

module M = {
  proc f() : bool = {
    var b : bool;
    b <$ {0,1};
    return b;
  }
}.

lemma L1 &m : Pr[M.f() @ &m : res] <= 1%r / 2%r.
proof.
dump "3-1" (byphoare (_ : true ==> res)).
proc; rnd; skip; smt.
trivial.
trivial.
qed.

lemma M_f : phoare[M.f : true ==> res] <= (1%r / 2%r).
proof. proc; rnd; skip; smt. qed.

lemma L2 &m : Pr[M.f() @ &m : res] <= 1%r / 2%r.
proof.
dump "3-2" (byphoare M_f).
trivial.
trivial.
qed.

lemma L3 &m : Pr[M.f() @ &m : res] <= 1%r / 2%r.
proof.
dump "3-3" (byphoare).
proc; rnd; skip; smt.
trivial.
trivial.
qed.
