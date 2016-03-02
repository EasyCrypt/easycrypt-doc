(* should be same as 1.ec, but no dumps *)

require import Bool Int List.

module type OR = {
  proc init() : unit
  proc incr_x() : unit
  proc incr_y() : unit
  proc incr_xy() : unit
  proc incr_yx() : unit
  proc loop(n : int) : bool
}.

module Or1 : OR = {
  var x, y : int
  var b : bool
  proc init() : unit = { x <- 0; y <- 0; b <- true; }
  proc incr_x() : unit = { x <- x + 1; }
  proc incr_y() : unit = { y <- y + 1; }
  proc incr_xy() : unit = { incr_x(); incr_y(); }    
  proc incr_yx() : unit = { incr_y(); incr_x(); }    
  proc loop(n : int) : bool = {
    while (0 < n) {
      if (b) incr_x(); else incr_y();
      b <- !b;
    }
    return !b;
  }
}.

module Or2 : OR = {
  var x, y : int
  var b : bool
  var trace : bool list
  proc init() : unit = { x <- 0; y <- 0; b <- true; trace <- []; }
  proc incr_x() : unit = { x <- x + 1; trace <- trace ++ [true]; }
  proc incr_y() : unit = { y <- y + 1; trace <- trace ++ [false]; }
  proc incr_xy() : unit = { incr_x(); incr_y(); }    
  proc incr_yx() : unit = { incr_y(); incr_x(); }    
  proc loop(n : int) : bool = {
    while (0 < n) {
      if (b) incr_x(); else incr_y();
      b <- !b;
    }
    return !b;
  }
}.

lemma eager_incr :
  eager[Or1.incr_x();, Or1.incr_y ~ Or2.incr_y, Or2.incr_x(); :
        ={x, y}(Or1, Or2) ==> ={x, y}(Or1, Or2)].
proof.
eager proc.
inline *; auto.
qed.

lemma eager_incr_x :
  eager[Or1.incr_x(); Or1.incr_y();, Or1.incr_x ~
        Or2.incr_x, Or2.incr_y(); Or2.incr_x(); :
        ={x, y, b}(Or1, Or2) ==> ={x, y, b}(Or1, Or2)].
proof.
proc*.
inline*; auto.
qed.

lemma eager_incr_y :
  eager[Or1.incr_x(); Or1.incr_y();, Or1.incr_y ~
        Or2.incr_y, Or2.incr_y(); Or2.incr_x(); :
        ={x, y, b}(Or1, Or2) ==> ={x, y, b}(Or1, Or2)].
proof.
proc*; inline*; auto.
qed.

lemma eager_incr_xy :
  eager[Or1.incr_x(); Or1.incr_y();, Or1.incr_xy ~
        Or2.incr_xy, Or2.incr_y(); Or2.incr_x(); :
        ={x, y, b}(Or1, Or2) ==> ={x, y, b}(Or1, Or2)].
proof.
eager proc.
eager seq 1 1 (incr : Or1.incr_x(); Or1.incr_y(); ~
                      Or2.incr_y(); Or2.incr_x(); :
                      ={x, y}(Or1, Or2) ==> ={x, y}(Or1, Or2)) :
              (={x, y, b}(Or1, Or2)).
eager call eager_incr.
auto.
eager call eager_incr_x; first auto.
eager call eager_incr_y; first auto.
sim.
qed.

lemma eager_incr_yx :
  eager[Or1.incr_x(); Or1.incr_y();, Or1.incr_yx ~
        Or2.incr_yx, Or2.incr_y(); Or2.incr_x(); :
        ={x, y, b}(Or1, Or2) ==> ={x, y, b}(Or1, Or2)].
proof.
eager proc.
eager seq 1 1 (incr : Or1.incr_x(); Or1.incr_y(); ~
                      Or2.incr_y(); Or2.incr_x(); :
                      ={x, y}(Or1, Or2) ==> ={x, y}(Or1, Or2)) :
              (={x, y, b}(Or1, Or2));
  [eager call eager_incr; first auto |
   eager call eager_incr_y; first auto |
   eager call eager_incr_x; first auto |
   sim].
qed.

lemma eager_loop :
  eager[Or1.incr_x(); Or1.incr_y();, Or1.loop ~
        Or2.loop, Or2.incr_y(); Or2.incr_x(); :
        ={n} /\ ={x, y, b}(Or1, Or2) ==>
        ={res} /\ ={x, y, b}(Or1, Or2)].
proof.
eager proc.
swap{2} 2 2; wp.
eager while (incr : Or1.incr_x(); Or1.incr_y(); ~
                    Or2.incr_y(); Or2.incr_x(); :
                    ={n} /\ ={x, y, b}(Or1, Or2) ==>
                    ={n} /\ ={x, y, b}(Or1, Or2)).
eager call eager_incr; first auto.
trivial.
swap{2} 2 2; wp.
eager if.
trivial.
move=> &m b'; inline*; auto.
eager call eager_incr_x; first auto.
eager call eager_incr_y; first auto.
sim.
qed.

module type ADV(O : OR) = {
  proc * main() : bool {O.incr_x O.incr_y O.incr_xy O.incr_yx O.loop}
}.

module G (Adv : ADV) = {
  proc main1() : bool = {
    var b : bool;
    Or1.init();
    Or1.incr_x(); Or1.incr_y();
    b <@ Adv(Or1).main();
    return b;
  }
  proc main2() : bool = {
    var b : bool;
    Or2.init();
    b <@ Adv(Or2).main();
    Or2.incr_y(); Or2.incr_x();
    return b;
  }
}.

lemma eager_adv (Adv <: ADV{Or1, Or2}) :
  eager[Or1.incr_x(); Or1.incr_y();, Adv(Or1).main ~
        Adv(Or2).main, Or2.incr_y(); Or2.incr_x(); :
        ={x, y, b}(Or1, Or2) ==> ={res} /\ ={x, y}(Or1, Or2)].
proof.
eager proc (incr : Or1.incr_x(); Or1.incr_y(); ~
                   Or2.incr_y(); Or2.incr_x(); :
                   ={x, y}(Or1, Or2) ==> ={x, y}(Or1, Or2))
           (={x, y, b}(Or1, Or2)).
eager call eager_incr; first auto.
trivial.
trivial.
apply eager_incr_x.
sim.
apply eager_incr_y.
sim.
apply eager_incr_xy.
sim.
apply eager_incr_yx.
sim.
apply eager_loop.
sim.
qed.

lemma G_Adv (Adv <: ADV{Or1, Or2}) :
  equiv[G(Adv).main1 ~ G(Adv).main2 :
        true ==> ={res} /\ ={x, y}(Or1, Or2)].
proof.
proc.
seq 1 1 : (={x, y, b}(Or1, Or2)); first inline*; auto.
eager call (eager_adv Adv); first auto.
qed.

lemma G_Adv' (Adv <: ADV{Or1, Or2}) :
  equiv[G(Adv).main1 ~ G(Adv).main2 :
        true ==> ={res} /\ ={x, y}(Or1, Or2)].
proof.
proc.
seq 1 1 : (={x, y, b}(Or1, Or2)); first inline*; auto.
eager (incr : Or1.incr_x(); Or1.incr_y(); ~
              Or2.incr_y(); Or2.incr_x(); :
              ={x, y}(Or1, Or2) ==> ={x, y}(Or1, Or2)) :
      (={x, y, b}(Or1, Or2)).
eager call eager_incr; first auto.
auto.
eager proc incr (={x, y, b}(Or1, Or2));
  [trivial | trivial | apply eager_incr_x | sim |
   apply eager_incr_y | sim | apply eager_incr_xy | sim |
   apply eager_incr_yx | sim | apply eager_loop | sim].
qed.
