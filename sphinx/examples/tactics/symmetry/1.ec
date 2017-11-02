require import Int.

module M = {
  proc f(x : int, y : int) : int = {
    var z : int;
    z = x - y;
    return z + 1;
  }
}.

module N = {
  proc g(x : int, y : int) : int = {
    var z : int;
    z = x + y;
    return -z;
  }
}.

lemma A :
  equiv[M.f ~ N.g :
        x{1} = y{2} /\ x{2} = -y{1} ==>
        1 - res{1} = res{2}].
proof.
dump "1-1" 67 (symmetry).
proc; auto; smt.
qed.

lemma B :
  equiv[M.f ~ N.g :
        x{1} = y{2} /\ x{2} = -y{1} ==>
        1 - res{1} = res{2}].
proof.
proc.
dump "1-2" 67 (symmetry).
auto; smt.
qed.
