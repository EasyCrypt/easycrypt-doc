require import Bool Int.

module M = {
  proc f(y : int) : int = {
    var x, z : int;
    x <- 0; z <- 0;
    while (x < y) {
      z = z + x;
      x = x + 1;
    }
    return z;
  }
}.

lemma X : hoare[M.f : true ==> res >= 0].
proof.
proc.
dump "1-1" (unroll 3).
sp.
while (x >= 0 /\ z >= 0).
auto; smt.
skip; smt.
qed.

lemma Y : equiv[M.f ~ M.f : ={y} ==> ={res}].
proof.
proc.
dump "1-2" (unroll{1} 3).
dump "1-3" (unroll{2} 3).
sp.
while (={x, y, z}).
auto.
skip; smt.
qed.

