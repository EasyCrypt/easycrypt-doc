require import Bool.

module M = {
  proc f() : bool = {
    var x, y, z : bool;
    x <$ {0,1};
    y <- x ^^ x;
    if (!y) {
      z <- true;
    } else {
      z <- false;
    }
    return z;
  }
}.

module N = {
  var x : bool
  proc f() : bool = {
    return x;
  }
}.

lemma X : hoare[M.f : true ==> res].
proof.
proc.
dump "1-1" (rcondt 3).
auto; smt.
auto; smt.
qed.

lemma Y : equiv[N.f ~ M.f : N.x{1} ==> ={res}].
proof.
proc.
dump "1-2" (rcondt{2} 3).
auto; smt.
auto; smt.
qed.

