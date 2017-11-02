require import Bool DBool Real.

module M = {
  proc f() : bool = {
    var x : bool;
    x <$ {0,1};
    return x;
  }
}.

module N = {
  proc f() : bool = {
    var x, y : bool;
    x <$ {0,1};
    y <$ {0,1};
    return x \/ y;
  }
}.

lemma L1 &m :
  Pr[M.f() @ &m : res] <= Pr[N.f() @ &m : res].
proof.
dump "2-1" (byequiv (_ : true ==> res{1} => res{2})).
proc; rnd; rnd{2}; skip; smt.
trivial.
trivial.
qed.

lemma L2 &m :
  Pr[M.f() @ &m : res] <= Pr[N.f() @ &m : res].
proof.
dump "2-2" (byequiv).
proc; rnd; rnd{2}; skip; smt.
trivial.
trivial.
qed.
