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

lemma X : hoare[M.f : true ==> 0 <= res].
proof.
proc.
dump "1-1" (splitwhile 3 : z <= 20).
while (0 <= x /\ 0 <= z); first auto; smt.
while (0 <= x /\ 0 <= z); first auto; smt.
auto; smt.
qed.

lemma Y : equiv[M.f ~ M.f : ={y} ==> ={res}].
proof.
proc.
dump "1-2" (splitwhile{2} 3 : z <= 20).
dump "1-3" (splitwhile{1} 3 : z <= 20).
while (={x,y,z} /\ 0 <= x{1} /\ 0 <= z{1}); first auto; smt.
while (={x,y,z} /\ 0 <= x{1} /\ 0 <= z{1}); first auto; smt.
auto; smt.
qed.
