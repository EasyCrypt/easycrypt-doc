require import Bool Int.

module M = {
  proc f() : int = {
    var x, y, z, w : int;
    x <- 1;
    y <- x + 1;
    z <- y + x + 2;
    w <- x - z;
    return w;
  }
}.

lemma X : hoare[M.f : true ==> res = -4].
proof.
proc.
dump "1-1" (cfold 1 ! 1).
dump "1-2" (cfold 2).
dump "1-3" (cfold 1).
dump "1-4" (cfold 1).
auto.
qed.
