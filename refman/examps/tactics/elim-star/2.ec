require import Int.

module M = {
  proc f(x : int) : int = {
    return x + 1;
  }
  proc g(x : int) : int = {
    var y : int;
    y <@ f(x);
    return y;
  }
}.

lemma M_f (x' : int) : hoare[M.f : x' = x ==> res = x' + 1].
proof. by proc; auto. qed.

lemma M_g : hoare[M.g : x = -1 ==> res = 0].
proof.    
proc.
dump "2-1" 67 (exists* x).
dump "2-2" 67 (elim*=> x').
dump "2-3" 67 (call (M_f x')).
auto.
qed.
