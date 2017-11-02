require import Int Bool.

module M = {
  var x : int
  proc f(y : int) : int = {
    x <- x + y;
    return x;
  }
  proc g(u : int) : int = {
    var z : int;
    x <- 5;
    z <@ f(u);
    return z + x;
  }
}.

module N = {
  var x : int
  proc f(y : int) : int = {
    x <- x - y;
    return -x;
  }
  proc g(u : int) : int = {
    var z : int;
    x <- -5;
    z <@ f(u);
    return z - x;
  }
}.

lemma M_N_f :
  equiv[M.f ~ N.f :
        ={y} /\ M.x{1} = -N.x{2} ==> ={res} /\ M.x{1} = -N.x{2}].
proof.
proc; auto; smt.
qed.

lemma X :
  equiv[M.g ~ N.g : ={u} ==> ={res}].
proof.
proc.
dump "1-1" 67
  (call (_ : ={y} /\ M.x{1} = -N.x{2} ==> ={res} /\ M.x{1} = -N.x{2})).
proc; auto; smt.
auto; smt.
qed.

lemma Y :
  equiv[M.g ~ N.g : ={u} ==> ={res}].
proof.
proc.
dump "1-2" 67 (call M_N_f).
auto; smt.
qed.

lemma Z :
  equiv[M.g ~ N.g : ={u} ==> ={res}].
proof.
proc.
dump "1-3" 67 (call (_ : M.x{1} = -N.x{2})).
auto; smt.
auto; smt.
qed.
