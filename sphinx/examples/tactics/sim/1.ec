require import Int.

module M = {
  proc f(x, y : int) : int = {
    var i : int;
    i <- 0; y <- y + 1;
    while (i < y) {
      x <- x + x;
      i <- i + 1;
    }
    return x;
  }
}.

module N = {
  var u : int
  var v : int
  proc f() : int = {
    var j : int;
    j <- 0;
    while (j < v) {
      u <- u + u;
      j <- j + 1;
    }
    return u;
  }
}.

lemma L1 :
  equiv[M.f ~ N.f : x{1} = N.u{2} /\ y{1} + 1 = N.v{2} ==> ={res}].
proof.
proc=> /=.
dump "1-1" 67 (sim).
auto.
qed.

lemma L2 :
  equiv[M.f ~ N.f :
        x{1} = N.u{2} /\ y{1} + 1 = N.v{2} /\ 0 <= y{1} ==> ={res} /\ 1 < N.v{2} + 1].
proof.
proc=> /=.
dump "1-2" 67 (sim / (0 < N.v{2}) : (x{1} = N.u{2} /\ y{1} = N.v{2})).
smt.
auto; smt.
qed.
