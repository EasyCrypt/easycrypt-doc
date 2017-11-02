require import Bool Int.

module M = {
  proc f(x : int) : int = {
    var y <- -1;
    while (0 < x) {
      y <- y + 2;
      x <- x - 1;
    }
    return y;
  }
}.

lemma L :
  hoare[M.f : true ==> res <> 0].
proof.
proc.
dump "2-1" (case (0 < x)).
rcondt 2; first auto.
while (1 <= y); auto; smt.
rcondf 2; first auto.
auto; smt.
qed.
