require import Bool Int.

module M = {
  proc f() : int = {
    var x, y, z : int;
    x <- 10;
    (y, z) <- (x + 1, 6);
    return y + z;
  }
}.

lemma X : hoare[M.f : true ==> res = 17].
proof.
proc.
dump "1-1" (alias 2 with w).
dump "1-2" (alias 3 u = w.`1 + 7).
dump "1-3" (alias 3).
auto.
qed.
