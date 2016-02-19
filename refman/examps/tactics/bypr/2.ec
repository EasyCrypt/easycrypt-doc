require import Bool DBool.

module M = {
  var x : bool
  proc f(y : bool) : bool = {
    var z : bool;
    z <$ {0,1};
    return x /\ y /\ z;
  }
}.

lemma L : hoare[M.f : !y \/ !M.x ==> !res].
proof.
dump "2-1" 67 (bypr).
move=> &m disj /=.
byphoare (_ : !y \/ !M.x ==> res)=> //.
hoare; proc; auto; smt.
qed.
