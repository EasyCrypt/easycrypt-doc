require import Bool Int.

module M = {
  proc f(y : int) : int = {
    var x : int;
    if (y >= 0) {
      x <- 0;
      while (x <> y) {
        x = x + 1;
      }
    }
    return y;
  }
}.

lemma X : hoare[M.f : true ==> res >= 0].
proof.
proc.
dump "2-1" (unroll 1.2).
admit.
qed.
