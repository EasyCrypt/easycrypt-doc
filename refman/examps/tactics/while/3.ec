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

module N = {
  proc f(n : int) : int = {
    return n * n;
  }
}.

lemma X :
  equiv[M.f ~ N.f : ={n} /\ n{1} >= 0 ==> res{1} <= res{2}].
proof.
proc.
dump "3-1" 67 (while{1} (0 <= i{1} <= n{1} /\ x{1} <= i{1} * i{1}) (n{1} - i{1})).
auto; smt.
auto; smt.
qed.
