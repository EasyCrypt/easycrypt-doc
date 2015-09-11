require import Int.

module M = {
  proc f(x, y : int) : int = {
    x <- x + y;
    return x;
  }
}.

module N = {
  proc f(x, y : int) : int = {
    x <- x - y;
    return x;
  }
}.

lemma X :
  equiv[M.f ~ N.f : x{1} = -x{2} /\ ={y} ==> res{1} = -res{2}].
proof.
proc.
simplify.
wp.
dump "1-1" (skip).
smt.
qed.
