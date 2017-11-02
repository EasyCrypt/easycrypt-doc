require import Int IntDiv Real.

module M = {
  proc f() : int = {
    var i <- 0; var j <- 0;
    while (i <= 0) {
      i <- i - 1;
    }
    while (j < 10) {
      i <- i + 2; j <- j + 1;
    }
    return i;
  }
}.

module N = {
  proc f() : int = {
    var i <- 0; var j <- 0;
    while (i <= 0) {
      i <- i - 1;
    }
    while (j < 20) {
      i <- i + 3; j <- j + 1;
    }
    return i;
  }
}.

lemma L : equiv[M.f ~ N.f : true ==> ={res}].
proof.
proc.
dump "1-1" 67 (seq 3 3 : (={i} /\ 0 < i{1} /\ i{1} <= 0)).
dump "1-2" 67 (while (={i} /\ i{1} <= 0); auto; smt).
dump "1-3" 67 (exfalso).
smt.
qed.
