require import Int Bool.

module M = {
  proc f(x : int, y : int) : int = {
    var z : int;
    if (y < x) {
      z <- x - y;
    } else {
      z <- y - x;
    }
    z <- z * 2;
    return z;
  }
}.

lemma X :
  hoare[M.f : true ==> 0 <= res].
proof.
proc.
dump "3-1" (if).
auto; smt.
auto; smt.
qed.
