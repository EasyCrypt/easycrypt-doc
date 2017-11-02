require import Bool Int IntDiv.

module M = {
  proc f() : int = {
    var i <- 0;
    while (i < 10) {
      i <- i + 1;
    }
    while (i < 20) {
      i <- i + 2;
    }
    return i;
  }
}.

module N = {
  proc f() : int = {
    var i <- 0;
    while (i < 10) {
      i <- i + 1;
    }
    i <- i + 2;
    while (i < 20) {
      i <- i + 2;
    }
    return i;
  }
}.

lemma X : hoare[M.f : true ==> res = 20].
proof.
proc.
dump "2-1" (rcondt 3).
while (i <= 10); auto; smt.
while (i <= 20 /\ i %% 2 = 0); first auto; smt.
wp; while (i <= 10); auto; smt.
qed.

lemma Y : equiv[M.f ~ N.f : true ==> ={res}].
proof.
proc.
dump "2-2" (rcondt{1} 3).
auto; first while (i <= 10); auto; smt.
sim.
qed.
