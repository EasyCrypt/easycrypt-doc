require import Int Bool.

module M = {
  proc f(x : int) = {
    if (x %% 3 = 1) x = x + 4;
    else x = x + 2;
    return x;
  }
}.

lemma L (n : int) :
  n = 1 \/ n = 2 =>
  hoare[M.f : x %% 3 = n ==> res %% 3 = (n %% 2) + 1].
proof.
dump "tactics-examp1-1" (move=> H).
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
