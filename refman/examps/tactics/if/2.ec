require import Bool Int.

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

module N = {
  proc f(x : int, y : int) : int = {
    var z : int;
    if (y < x) {
      z <- x - y + 1;
    } else {
      z <- y - x + 1;
    }
    return z;
  }
}.

lemma X :
  equiv[M.f ~ N.f :
    ={x,y} ==> 0 <= res{1} /\ res{1} = 2 * (res{2} - 1)].
proof.
proc.
simplify.
dump "2-1" (if{1}).
if{2}; auto; smt.
if{2}; auto; smt.
qed.
