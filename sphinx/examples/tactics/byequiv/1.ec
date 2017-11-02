require import Int DInterval.

module M = {
  var x : int
  proc f(y : int) : int = {
    var z : int;
    z <$ [x .. y];
    return z;
  }
}.

lemma L1 (y1 y2 : int) &m1 &m2 :
  M.x{m1} = M.x{m2} => y1 = y2 =>
  Pr[M.f(y1) @ &m1 : res = 0] =
  Pr[M.f(y2) @ &m2 : res = 0].
proof.
move=> x_eq y_eq.
dump "1-1" (byequiv (_ : ={M.x, y} ==> ={res})).
proc; auto.
trivial.
trivial.
qed.

lemma M_M_f : equiv[M.f ~ M.f : ={M.x, y} ==> ={res}].
proof. proc; auto. qed.

lemma L2 (y1 y2 : int) &m1 &m2 :
  M.x{m1} = M.x{m2} => y1 = y2 =>
  Pr[M.f(y1) @ &m1 : res = 0] =
  Pr[M.f(y2) @ &m2 : res = 0].
proof.
move=> x_eq y_eq.
dump "1-2" (byequiv M_M_f).
trivial.
trivial.
qed.

lemma L3 (y1 y2 : int) &m1 &m2 :
  M.x{m1} = M.x{m2} => y1 = y2 =>
  Pr[M.f(y1) @ &m1 : res = 0] =
  Pr[M.f(y2) @ &m2 : res = 0].
proof.
move=> x_eq y_eq.
dump "1-3" (byequiv).
proc; auto; progress; [by rewrite x_eq y_eq | by rewrite -x_eq -y_eq].
trivial.
trivial.
qed.

lemma L4 (y1 y2 : int) &m1 &m2 :
  M.x{m1} = M.x{m2} => y1 = y2 =>
  Pr[M.f(y1) @ &m1 : res = 0] =
  Pr[M.f(y2) @ &m2 : res = 0].
proof.
move=> x_eq y_eq.
byequiv [-eq].
proc; auto; progress; [by rewrite x_eq y_eq | by rewrite -x_eq -y_eq].
trivial.
trivial.
qed.


