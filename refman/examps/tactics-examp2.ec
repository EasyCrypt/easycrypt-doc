require import Bool Int Real.

module type T = {
  proc f() : unit
}.
module G(X : T) = {
  var x : int
  proc g() : unit = {
    X.f();
  }
}.

lemma Invar (X <: T{G}) (n : int) :
  islossless X.f =>
  phoare [G(X).g : G.x = n ==> G.x = n] = 1%r.
proof.
dump "tactics-examp2-1" (move=> LL).
dump "tactics-examp2-2" (proc).
dump "tactics-examp2-3" (call (_ : true)).
dump "tactics-examp2-4" (apply LL).
dump "tactics-examp2-5" (skip).
dump "tactics-examp2-6" (trivial).
qed.
