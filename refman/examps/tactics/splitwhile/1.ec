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
dump "1-1" (splitwhile 3 : z <= 20).
while (x >= 0 /\ z >= 0); first auto; smt.
while (x >= 0 /\ z >= 0); first auto; smt.
auto; smt.
qed.

lemma Y : equiv[M.f ~ M.f : ={y} ==> ={res}].
proof.
proc.
dump "1-2" (splitwhile{2} 3 : z <= 20).
dump "1-3" (splitwhile{1} 3 : z <= 20).
while (={x,y,z} /\ x{1} >= 0 /\ z{1} >= 0); first auto; smt.
while (={x,y,z} /\ x{1} >= 0 /\ z{1} >= 0); first auto; smt.
auto; smt.
qed.
