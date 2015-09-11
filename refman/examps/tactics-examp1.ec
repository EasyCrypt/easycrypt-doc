require import Int Bool.

module M = {
  proc f(x : int) = {
    if (x %% 3 = 1) x = x + 4;
    else x = x + 2;
    return x;
  }
}.

lemma L (x : int) :
  x = 1 \/ x = 2 =>
  hoare[M.f : x %% 3 = x ==> res %% 3 = (x %% 2) + 1].
proof.
dump "tactics-examp1-1" (move=> zor1_x).
dump "tactics-examp1-2" (proc).
dump "tactics-examp1-3" (if).
  (* if branch *)
  dump "tactics-examp1-4" (wp).
  dump "tactics-examp1-5" (skip).
  dump "tactics-examp1-6" 72 (smt).
  (* then branch *)
  dump "tactics-examp1-7" (wp).
  dump "tactics-examp1-8" (skip).
  dump "tactics-examp1-9" (smt).
qed.
