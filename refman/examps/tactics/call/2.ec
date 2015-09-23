require import Bool Int.

module M = {
  var x : int
  proc f(y : int) : unit = {
    x <- x + (2 * y);
  }
  proc g(u : int) : bool = {
    x <- u;
    f(7);
    return M.x %% 2 = 0;
  }
}.

module N = {
  var x : int
  proc g(u : int) : bool = {
    x <- u;
    return N.x %% 2 = 0;
  }
}.

lemma M_f (z : int) :
  phoare [M.f : M.x %% 2 = z %% 2 ==> M.x %% 2 = z %% 2] = 1%r.
proof.
proc; auto; smt.
qed.

lemma X :
  equiv[M.g ~ N.g : u{1} %% 2 = u{2} %% 2 ==> ={res}].
proof.
proc.
sp 0 1; exists* N.x{2}; elim*=> x2.
dump "2-1" 67
  (call{1} (_ : M.x %% 2 = x2 %% 2 ==> M.x %% 2 = x2 %% 2)).
proc.
auto; smt.
auto; smt.
qed.

lemma Y :
  equiv[M.g ~ N.g : u{1} %% 2 = u{2} %% 2 ==> ={res}].
proof.
proc.
sp 0 1; exists* N.x{2}; elim*=> x2.
dump "2-2" 67 (call{1} (M_f x2)).
auto; smt.
qed.
