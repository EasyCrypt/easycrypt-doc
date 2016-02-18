require import Bool DBool Real.

module M = {
  proc f() : bool = {
    var x : bool;
    x <$ {0,1};
    return x;
  }
}.

module N = {
  var bad : bool
  proc f() : bool = {
    var x, y : bool;
    x <$ {0,1};
    y <$ {0,1};
    bad <$ {0,1};
    return (x \/ y) /\ !bad;
  }
}.

lemma L1 &m :
  Pr[M.f() @ &m : res] <= Pr[N.f() @ &m : res] + Pr[N.f() @ &m : N.bad].
proof.
dump "3-1" (byequiv (_ : true ==> ! N.bad{2} => res{1} => res{2})).
proc; (do 2! rnd{2}); rnd; skip; progress; smt.
trivial.
qed.

lemma L2 &m :
  Pr[M.f() @ &m : res] <= Pr[N.f() @ &m : res] + Pr[N.f() @ &m : N.bad].
proof.
dump "3-2" (byequiv).
proc; (do 2! rnd{2}); rnd; skip; progress; smt.
trivial.
qed.
