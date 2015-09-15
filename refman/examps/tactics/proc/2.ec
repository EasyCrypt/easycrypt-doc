require import Int.

module type OR = {
  proc f1() : unit
  proc f2() : unit
}.

module Or : OR = {
  var x : int
  proc init() : unit = {
    x <- 0;
  }
  proc f1() : unit = {
    x <- x + 2;
  }
  proc f2() : unit = {
    x <- x - 2;
  }
}.

module type T(O : OR) = {
  proc g(y : int) : int {O.f1 O.f2}
}.

lemma X (M <: T{Or}) :
  equiv[M(Or).g ~ M(Or).g :
        ={y, Or.x, glob M} /\ Or.x{1} %% 2 = 0 ==>
        ={res, Or.x} /\ Or.x{1} %% 2 = 0].
proof.
dump "2-1" (proc (={Or.x} /\ Or.x{1} %% 2 = 0)).
trivial.
trivial.
proc; auto; smt.
proc; auto; smt.
qed.
