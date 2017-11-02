require import Int.

module M = {
  var x : int
  proc f(y : int) : int = {
    var z <- -x + y;
    return x + z + x;
  }
}.

module N = {
  var x : int
  proc f(y : int) : int = {
    var z <- x + -y;
    return y + z + y;
  }
}.

lemma L1 :
  equiv[M.f ~ N.f : ={y} /\ M.x{1} = N.x{2} ==> ={res}].
proof.
dump "1-1" 67 (exists* (y + 1){1}, (N.x{2} - y{1})).
proc; auto; smt.
qed.

lemma L2 :
  equiv[M.f ~ N.f : ={y} /\ M.x{1} = N.x{2} ==> ={res}].
proof.
proc.
dump "1-2" 67 (exists* (y + 1){1}, (N.x{2} - y{1})).
auto; smt.
qed.

lemma L3 : hoare[M.f : 0 <= y /\ 0 <= M.x ==> 0 <= res].
proof.
dump "1-3" 67 (exists* (y + M.x - 2)).
proc; auto; smt.
qed.

lemma L4 : hoare[M.f : 0 <= y /\ 0 <= M.x ==> 0 <= res].
proof.
proc.
dump "1-4" 67 (exists* (y + M.x - 2)).
auto; smt.
qed.
