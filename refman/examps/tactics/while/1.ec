require import Bool Int.

module M = {
  proc f(x : int, y : int) : int = {
    var z : int;
    z <- 0;
    while (0 < x) {
      z <- z + 1;
      x <- x - 1;
    }
    return z + y;
  }
}.

module N = {
  proc f(x : int, y : int) : int = {
    var i, z : int;
    z <- 1; i <- 1;
    while (i <= x) {
      z <- z + 2;
      i <- i + 1;
    }
    return z + y;
  }
}.

lemma X (n : int) :
  equiv[M.f ~ N.f : ={x,y} /\ y{1} = n ==> (res{1} - n) * 2 + 1 = res{2} - n].
proof.
proc.
simplify.
dump "1-1" 67 (while (x{1} - 1 = x{2} - i{2} /\ z{1} * 2 + 1 = z{2})).
auto; smt.
auto; smt.
qed.
