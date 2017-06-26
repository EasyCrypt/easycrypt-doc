require import Int IntExtra DInterval Real RealExtra List.

module M = {
  var x : int
  proc f(y : int) : int = {
    var z : int;
    x <$ [x .. y];
    return x;
  }
}.

lemma L1 (x' y' : int) &m :
  x' + 1 = y' => M.x{m} = x' =>
  Pr[M.f(y') @ &m : res = x'] = 1%r / 2%r.
proof.
move=> range x_eq.
dump "1-1" (byphoare (_ : M.x + 1 = y /\ x' = M.x ==> x' = res)).
proc; rnd; skip; progress.
  rewrite (dinterE M.x{hr} (M.x{hr} + 1)).
  have -> : max 0 (M.x{hr} + 1 - M.x{hr} + 1) = 2 by smt.
  have -> : range M.x{hr} (M.x{hr} + 1 + 1) = [M.x{hr}; M.x{hr} + 1] by smt.
  smt.
smt.
trivial.
qed.

lemma M_f (x' : int) :
  phoare[M.f : M.x + 1 = y /\ x' = M.x ==> x' = res] = (1%r / 2%r).
proof.
proc; rnd; skip; progress.
  rewrite (dinterE M.x{hr} (M.x{hr} + 1)).
  have -> : max 0 (M.x{hr} + 1 - M.x{hr} + 1) = 2 by smt.
  have -> : range M.x{hr} (M.x{hr} + 1 + 1) = [M.x{hr}; M.x{hr} + 1] by smt.
  smt.
qed.

lemma L2 (x' y' : int) &m :
  x' + 1 = y' => M.x{m} = x' =>
  Pr[M.f(y') @ &m : res = x'] = 1%r / 2%r.
proof.
move=> range x_eq.
dump "1-2" (byphoare (M_f x')).
smt.
trivial.
qed.
