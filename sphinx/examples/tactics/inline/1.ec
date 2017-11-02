require import Bool Int.

module M = {
  var y : int
  proc f(x : int) : int = {
    x <- x + 1;
    return x * 2;
  }
  proc g(x : int) : bool = {
    y <@ f(x - 1);
    return x + y + 1 = 3;
  }
  proc h(x : int) : bool = {
    var b : bool;
    b <@ g(x + 1);
    return !b;
  }
}.

lemma X :
  equiv[M.h ~ M.h : ={x} ==> ={res}].
proof.
proc.
dump "1-1" (inline M.g).
dump "1-2" (inline{2} M.f).
dump "1-3" (inline M.f).
auto; smt.
qed.
