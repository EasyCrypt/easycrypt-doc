require import Int.

module type OR = {
  proc f1() : unit
  proc f2() : unit
  proc f3() : unit
}.

module Or : OR = {
  var x : int
  proc f1() : unit = {
    x <- x + 2;
  }
  proc f2() : unit = {
    x <- x - 2;
  }
  proc f3() : unit = {
    x <- x + 1;
  }
}.

module type T(O : OR) = {
  proc g(y : int) : int {O.f1 O.f2}
}.

lemma X (M <: T{Or}) :
  equiv[M(Or).g ~ M(Or).g :
        ={y, glob M} /\ Or.x{1} %% 2 = Or.x{2} %% 2 ==>
        ={res} /\ Or.x{1} %% 2 = Or.x{2} %% 2].
proof.
dump "2-1" (proc (Or.x{1} %% 2 = Or.x{2} %% 2)).
trivial.
trivial.
proc; auto; smt.
proc; auto; smt.
qed.
