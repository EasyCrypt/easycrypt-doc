require import Int Bool.

module M = {
  proc f(x : int, y : int) : int = {
    var z : int;
    if (x > y) {
      z <- x - y;
    } else {
      z <- y - x;
    }
    z <- z * 2;
    return z;
  }
}.

lemma X :
  hoare[M.f : true ==> res >= 0].
proof.
proc.
dump "3-1" (if).
auto; smt.
auto; smt.
qed.
