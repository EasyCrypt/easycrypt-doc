require import Int Distr.

module type OR = {
  proc init() : unit
  proc qry(x : int) : int
}.

op low : int = -100.
op upp : int = 100.

module Or1 : OR = {
  var qry, rsp : int
  var queried : bool

  proc init() = {
    qry <$ [low .. upp]; rsp <$ [low .. upp];
    queried <- false;
  }

  proc qry(x : int) : int = {
    var y : int;
    if (x = qry) {
      y <- rsp;
      queried <- true;
    } else {
      y <$ [low .. upp];
    }
    return y;
  }
}.

module Or2 : OR = {
  var qry : int
  var queried : bool

  proc init() = {
    qry <$ [low .. upp];
    queried <- false;
  }

  proc qry(x : int) : int = {
    var y : int;
    y <$ [low .. upp];
    queried <- queried \/ x = qry;
    return y;
  }
}.

module type ADV(O : OR) = {
  proc * f() : bool {O.qry}
}.

module M(Adv : ADV) = {
  proc h() : bool = {
    var b : bool;
    Or1.init();
    b <@ Adv(Or1).f();
    return b;
  }
}.

module N(Adv : ADV) = {
  proc h() : bool = {
    var b : bool;
    Or2.init();
    b <@ Adv(Or2).f();
    return b;
  }
}.

lemma X (Adv <: ADV{Or1, Or2}) :
  (forall (O <: OR{Adv}),
   islossless O.qry => islossless Adv(O).f) =>
  equiv
  [M(Adv).h ~ N(Adv).h : true ==> ! Or2.queried{2} => ={res}].
proof.
move=> ll_Adv_f.
proc.
seq 1 1 : (Or1.qry{1} = Or2.qry{2}).
  inline *; wp; rnd{1}; rnd; skip; smt.
dump "4-1" 67 (call (_ : Or2.queried, (Or1.qry{1} = Or2.qry{2}))).
proc; if {1}; auto; smt.
move=> &2 queried; proc; if; auto; smt.
move=> &1; proc; auto; smt.
skip; smt.
qed.

lemma Y (Adv <: ADV{Or1, Or2}) :
  (forall (O <: OR{Adv}),
   islossless O.qry => islossless Adv(O).f) =>
  equiv
  [M(Adv).h ~ N(Adv).h :
   true ==>
   Or1.queried{1} = Or2.queried{2} /\ (! Or2.queried{2} => ={res})].
proof.
move=> ll_Adv_f.
proc.
seq 1 1 :
  (Or1.qry{1} = Or2.qry{2} /\ Or1.queried{1} = Or2.queried{2}).
  inline *; wp; rnd{1}; rnd; skip; smt.
dump "4-2" 67
  (call (_ : 
         Or2.queried,
         (Or1.qry{1} = Or2.qry{2} /\ Or1.queried{1} = Or2.queried{2}),
         (Or1.queried{1} = Or2.queried{2}))).
proc; if {1}; auto; smt.
move=> &2 queried; proc; if; auto; smt.
move=> &1; proc; auto; smt.
skip; smt.
qed.
