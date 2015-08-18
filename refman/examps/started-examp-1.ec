(* Load (require) the theory of the booleans and import its symbols,
   into the environment. The Bool theory defines, among other symbols,
   the exclusive-or operator (^^) and the uniform distribution on
   booleans ({0,1}) *)

require import Bool.

(* G1.f() yields a randomly chosen boolean *)

module G1 = {
  proc f() : bool = {
    var x : bool;
    x <$ {0,1};       (* sample x in {0,1} *)
    return x;
  }
}.

(* G2.f() yields the exclusive-or of two randomly chosen
   booleans *)

module G2 = {
  proc f() : bool = {
    var x, y : bool;
    x <$ {0,1}; y <$ {0,1};
    return x ^^ y;
  }
}.

(* PRHL judgement relating G1.f and G2.f. ={res} means res{1} =
   res{2}, i.e., the result of G1.f is equal to (has same distribution
   as) result of G2.f *)

lemma G1_G2_f : equiv[G1.f ~ G2.f : true ==> ={res}].
proof.
  proc.
  (* handle choice of x in G2.f *)
  seq 0 1 : true.
    rnd {2}. skip. smt.
  (* handle choice of x in G1.f / y in G2.f *)
  rnd (fun (z : bool) => z ^^ x{2}). skip. smt.
qed.

(* G1.f and G2.f are equally likely to return true: *)

lemma G1_G2_true &m :
  Pr[G1.f() @ &m : res] = Pr[G2.f() @ &m : res].
proof.
  byequiv.
  apply G1_G2_f. trivial. trivial.
qed.

(* G1.f and G2.f are equally likely to return false: *)

lemma G1_G2_false &m :
  Pr[G1.f() @ &m : !res] = Pr[G2.f() @ &m : !res].
proof.
  byequiv.
  apply G1_G2_f. trivial. trivial.
qed.
