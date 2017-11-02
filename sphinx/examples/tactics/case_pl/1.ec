require import Bool Int.

module M = {
  var x : int
  proc f(x y : int) : int = {
    var z : int;
    if (x < y) {
      z <- y - x;
    } else {
      z <- x - y;
    }
    return z;
  }
}.

module N = {
  var x : int
  proc f(x y : int) : int = {
    var z : int;
    if (y <= x) {
      z <- x - y;
    } else {
      z <- y - x;
    }
    return z;
  }
}.

lemma L1 :
  equiv[M.f ~ N.f : ={x, y} ==> ={res}].
proof.
proc=> /=.
dump "1-1" (case (x{1} < y{1})).
rcondt{1} 1; first auto.
rcondf{2} 1; first auto; smt.
auto.
rcondf{1} 1; first auto.
rcondt{2} 1; first auto; smt.
auto.
qed.
