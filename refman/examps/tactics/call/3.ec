require import Int.

module type OR = {
  proc init(i : int) : unit
  proc f1() : unit
  proc f2() : unit
}.

module Or : OR = {
  var x : int
  proc init(i : int) : unit = {
    x <- i;
  }
  proc f1() : unit = {
    x <- x + 2;
  }
  proc f2() : unit = {
    x <- x - 2;
  }
}.

module type T(O : OR) = {
  proc g() : int {O.f1 O.f2}
}.

module M(A : T) = {
  proc h(y : int) : int = {
    var z : int;
    Or.init(y * 2);
    z <@ A(Or).g();
    return z;
  }
}.

module N(Adv : T) = {
  proc h(y : int) : int = {
    var z : int;
    Or.init(y * 4);
    z <@ Adv(Or).g();
    return z;
  }
}.

lemma X (Adv <: T{Or}) :
  equiv[M(Adv).h ~ N(Adv).h :
        ={y, glob Adv} ==>
        ={res}].
proof.
proc.
seq 1 1 : (={glob Adv} /\ Or.x{1} %% 2 = Or.x{2} %% 2).
  inline *; auto; smt.
dump "3-1" 67 (call (_ : Or.x{1} %% 2 = Or.x{2} %% 2)).
proc; auto; smt.
proc; auto; smt.
skip; smt.
qed.
