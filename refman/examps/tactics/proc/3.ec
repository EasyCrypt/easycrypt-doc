require import Int Distr DInterval.

module type OR = {
  proc qry(x : int) : int
}.

op low : int = -100.
op upp : int = 100.

module Or1 : OR = {
  var qry, rsp : int
  var queried : bool

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

  proc qry(x : int) : int = {
    var y : int;
    y <$ [low .. upp];
    queried <- queried \/ x = qry;
    return y;
  }
}.

module type ADV(O : OR) = {
  proc * f() : bool
}.

lemma X (Adv <: ADV{Or1, Or2}) :
  (forall (O <: OR{Adv}),
   islossless O.qry => islossless Adv(O).f) =>
  equiv
  [Adv(Or1).f ~ Adv(Or2).f :
   Or1.qry{1} = Or2.qry{2} ==> ! Or2.queried{2} => ={res}].
proof.
move=> ll_Adv_f.
dump "3-1" 70 (proc Or2.queried (Or1.qry{1} = Or2.qry{2})).
trivial.
smt.
apply ll_Adv_f.
proc; if {1}; auto; smt.
move=> &2 queried; proc; if; auto; smt.
move=> &1; proc; auto; smt.
qed.

lemma Y (Adv <: ADV{Or1, Or2}) :
  (forall (O <: OR{Adv}),
   islossless O.qry => islossless Adv(O).f) =>
  equiv
  [Adv(Or1).f ~ Adv(Or2).f :
   Or1.qry{1} = Or2.qry{2} /\ Or1.queried{1} = Or2.queried{2} ==>
   Or1.queried{1} = Or2.queried{2} /\ (! Or2.queried{2} => ={res})].
proof.
move=> ll_Adv_f.
dump "3-2" 70
     (proc Or2.queried
           (Or1.qry{1} = Or2.qry{2} /\ Or1.queried{1} = Or2.queried{2})
           (Or1.queried{1} = Or2.queried{2})).
trivial.
smt.
apply ll_Adv_f.
proc; if {1}; auto; smt.
move=> &2 queried; proc; if; auto; smt.
move=> &1; proc; auto; smt.
qed.
