require import Bool Int.

module M = {
  proc f(x : int) : int = {
    var i, n : int;
    n <- x; i <- 0;
    while (i < n) {
      i <- i + 1;
      x <- x - 1;
    }
    return x;
  }
}.

lemma X :
  hoare[M.f : x >= 0 ==> res = 0].
proof.
proc.
dump "2-1" 67 (while (i <= n /\ x + i = n)).
auto; smt.
auto; smt.
qed.
