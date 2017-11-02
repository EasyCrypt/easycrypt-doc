require import Bool DBool Real.

module M = {
  var bad : bool
  proc f() : bool = {
    var x : bool;
    x <$ {0,1};
    bad <$ {0,1};
    return x;
  }
}.

module N = {
  var bad : bool
  proc f() : bool = {
    var x : bool;
    x <$ {0,1};
    bad <$ {0,1};
    return x /\ !bad;
  }
}.

lemma L1 &m :
  `| Pr[M.f() @ &m : res] - Pr[N.f() @ &m : res] | <=
  Pr[N.f() @ &m : N.bad].  
proof.
dump "4-1"
  (byequiv (_ : true ==> M.bad{1} = N.bad{2} /\ (! N.bad{2} => ={res})) : M.bad).
proc; auto; smt.
trivial.
smt.
qed.

lemma M_N_f :
  equiv[M.f ~ N.f : true ==> M.bad{1} = N.bad{2} /\ (! N.bad{2} => ={res})].
proof. proc; auto; smt. qed.

lemma L2 &m :
  `| Pr[M.f() @ &m : res] - Pr[N.f() @ &m : res] | <=
  Pr[N.f() @ &m : N.bad].  
proof.
dump "4-2" (byequiv M_N_f : M.bad).
trivial.
smt.
qed.
