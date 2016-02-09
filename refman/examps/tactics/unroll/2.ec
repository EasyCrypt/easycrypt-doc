require import Bool Int.

module M = {
  proc f(y : int) : int = {
    var x : int;
    if (0 <= y) {
      x <- 0;
      while (x <> y) {
        x = x + 1;
      }
    }
    return y;
  }
}.

lemma X : hoare[M.f : true ==> 0 <= res].
proof.
proc.
dump "2-1" (unroll 1.2).
admit.
qed.
