require import Int Bool DInterval.

module M = {
  proc g() : int = {
    var x : int;
    x <$ [1 .. 10];
    return x;
  }

  proc f(y : int) : int = {
    var x : int;
    if (y = 0) {
      y <- 2;
    } else {
      y <- y - 2;
    }
    x <@ g();
    return x + y;
  }
}.

module N = {
  proc f(y : int) : int = {
    var x : int;
    if (y = 0) {
      y <- 3;
    } else {
      y <- y - 1;
    }
    x <$ [1 .. 10];
    return x + y - 1;
  }
}.

lemma X :
  equiv[M.f ~ N.f :
        ={y} ==> ={res}].
proof.
proc.
dump "1-1" 67 (sp).
inline M.g; auto; smt.
qed.

