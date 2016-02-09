require import Bool Int.

module M = {
  proc f(n : int) : int = {
    var i, x : int;
    x <- 0; i <- 0;
    while (i < n) {
      x <- x + (i + 1);
      i <- i + 1;
    }
    return x;
  }
}.

lemma X (m : int) :
  hoare[M.f : m = n /\ 0 <= n ==> res <= m * m].
proof.
proc.
dump "2-1" 67 (while{1} (0 <= i <= n /\ x <= i * i)).
auto; smt.
auto; smt.
qed.
