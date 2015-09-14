require import Int.

module M = {
  proc f(x : int) : int = {
    x <- x + 1;
    x <- x + 1;
    return x;
  }
}.

lemma X :
  hoare[M.f : x %% 2 = 0 ==> res %% 2 = 0].
proof.
proc.
dump "2-1" (seq 1 : (x %% 2 = 1)).
auto; smt.
auto; smt.
qed.


