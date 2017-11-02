require import Bool DBool Distr.

module M = {
  proc f() : bool = {
    var x : bool;
    x <$ {0,1};
    return x;
  }
}.

lemma X :
  equiv[M.f ~ M.f :
    true ==> ={res}].
proof.
proc.
dump "3-1" (rnd{1}).
admit.
qed.
