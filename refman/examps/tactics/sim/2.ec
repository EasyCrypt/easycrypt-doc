require import Int IntDiv.

module M = {
  var x, i, j : int
  proc f() : unit = {
    x <- x + i;
    i <- i + 1;
  }
  proc g() : unit = {
    x <- x + j;
    j <- j - 1;
  }
  proc h() : int = {
    var k <- 0;
    x <- 0; i <- 0; j <- 0;
    while (k < 10) {
      f();
      k <- k + 1;
    }
    while (k < 20) {
      g();
      k <- k + 1;
    }
    return k;
  }
}.

module N = {
  var x, i, j : int
  proc f() : unit = {
    x <- x + -i;
    i <- i + 1;
  }
  proc g() : unit = {
    x <- x + -j;
    j <- j - 1;
  }
  proc h() : int = {
    var k <- 0;
    x <- 0; i <- 0; j <- 0;
    while (k < 10) {
      f();
      k <- k + 1;
    }
    while (k < 20) {
      g();
      k <- k + 1;
    }
    return k;
  }
}.

lemma L1 :
  equiv[M.h ~ N.h :
        true ==> `|M.x{1} + res{1}| = `|N.x{2} - res{2}|].
proof.
proc.
dump "2-1" 67
  (sim (M.f ~ N.f : M.i{1} = N.i{2})
       (M.g ~ N.g : M.j{1} = N.j{2}) /
       (M.x{1} = -N.x{2}) : (={k})).
smt.
proc; auto; smt.
proc; auto; smt.
auto.
qed.

lemma L2 :
  equiv[M.h ~ N.h :
        true ==> `|M.x{1} + res{1}| = `|N.x{2} - res{2}|].
proof.
proc.
dump "2-2" 67
  (sim (_ : M.i{1} = N.i{2} /\ M.j{1} = N.j{2}) /
       (M.x{1} = -N.x{2}) : (={k})).
smt.
proc; auto; smt.
proc; auto; smt.
auto.
qed.


