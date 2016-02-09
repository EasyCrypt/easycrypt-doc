require import Int Bool DInterval.

module M = {
  proc f() : int = {
    var x, y : int;
    y <- 2;
    x <$ [1 .. 10];
    return x + y;
  }
}.

lemma X :
  hoare[M.f : true ==> 3 <= res <= 12].
proof.
proc.
dump "1-1" (rnd).
auto; smt.
qed.
