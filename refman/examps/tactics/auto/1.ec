require import Bool Int NewDistr DInterval.

module M = {
  proc f(x y : int) : int = {
    var z1, z2 : int;
    if (y < x) {
      z1 <- x; x <- y; y <- z1;
    }
    z1 <$ [x .. y];
    z2 <$ [x - 1 .. y + 1];
    return z1 + z2;
  }
}.

module N = {
  proc f(x y : int) : int = {
    var z1, z2 : int;
    z1 <$ [x .. y];
    x <- x - 1; y <- y + 1;
    z2 <$ [x .. y];
    x <- x - 1; y <- y + 1;
    return z1 + z2;
  }
}.

lemma L1 :
  hoare[M.f : 1 <= y < x ==> 0 <= res].
proof.
proc=> /=.
dump "1-1" 67 (auto).
progress; smt.
qed.

lemma L2 :
  hoare[N.f : 1 <= y < x ==> 0 <= res].
proof.
proc=> /=.
dump "1-2" (auto).
smt.
qed.

lemma L3 :
  equiv[M.f ~ N.f : ={x, y} /\ 1 < x{1} <= y{2} ==> ={res}].
proof.
proc=> /=.
dump "1-3" (auto).
progress; smt.
qed.
