require import Bool Int.

module M = {
  var x, y : int
  proc f() : int = {
    y <- y + 1;
    x <- 0;
    x <- x + 1;
    y <- y + 1;
    return y;
  }
}.

lemma X : hoare[M.f : M.y = 3 ==> res = 5].
proof.
proc.
dump "1-1" (kill 2 ! 2).
auto.
auto.
qed.

lemma Y : equiv[M.f ~ M.f : ={M.y} /\ M.y{1} = 3 ==> ={res} /\ res{1} = 5].
proof.
proc.
dump "1-2" (kill{2} 2 ! 2).
auto.
auto.
qed.
