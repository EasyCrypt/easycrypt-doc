require import Int IntDiv.

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
  proc g() : unit {O.f1 O.f2}
}.

module M(A : T) = {
  proc h(y : int) : unit = {
    Or.init(y * 2);
    A(Or).g();
  }
}.

module N(Adv : T) = {
  proc h(y : int) : unit = {
    var z : int;
    Or.init(y * 4);
    Adv(Or).g();
  }
}.

lemma X (Adv <: T{Or}) :
  equiv[M(Adv).h ~ N(Adv).h :
        ={y, glob Adv} ==>
        Or.x{1} %% 2 = 0 /\ Or.x{2} %% 2 = 0].
proof.
proc.
seq 1 1 : (={y, glob Adv} /\ Or.x{1} %% 2 = 0 /\ Or.x{2} %% 2 = 0).
  inline *; auto; smt.
dump "3-1" 67 (call (_ : Or.x{1} %% 2 = 0 /\ Or.x{2} %% 2 = 0)).
proc; auto; smt.
proc; auto; smt.
skip; smt.
qed.
