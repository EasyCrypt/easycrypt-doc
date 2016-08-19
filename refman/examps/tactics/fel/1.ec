require import List Int IntExtra DInterval Real RealExtra.
require import StdBigop. import Bigreal BRA.
require import StdOrder. import RealOrder.
require import FelTactic.

lemma mem_rem_eq ['a] (z y : 'a, xs : 'a list) :
  y <> z => mem (rem z xs) y = mem xs y.
proof.
move=> ne_yz; elim xs=> [// | x xs IH].
case (x = z)=> [-> //= | -> /=]; [by rewrite ne_yz | by rewrite IH].
qed.

lemma count_mem_size ['a] (xs ys : 'a list) :
  uniq ys => count (mem xs) ys <= size xs.
proof.
move: ys xs; elim=> [xs /= | y ys IH xs /= [not_mem_ys_y uniq_ys]].
by rewrite size_ge0.
case (mem xs y)=> [mem_xs_y | _].
rewrite b2i1 (eq_in_count (mem xs) (mem (rem y xs))) //.
  move=> u mem_ys_u; split=> [mem_xs_u | mem_rem_y_xs_u].
  by rewrite mem_rem_eq //; case (u = y)=> // ->>.
  by rewrite (mem_rem y xs u).
have count_rem : count (mem (rem y xs)) ys <= size xs - 1.
  have IH_rem := IH (rem y xs) uniq_ys.
  by rewrite -(size_rem y xs).
by rewrite -(lez_add2l (-1)) addzA /= addzC.
by rewrite b2i0 /= IH.
qed.

op upp : { int | 1 <= upp } as ge1_upp.
op n : { int | 0 <= n } as ge0_n.

module type OR = {
  proc init() : unit
  proc gen() : bool
  proc add(_ : int) : unit
}.

module Or : OR = {
  var won : bool
  var gens : int list

  proc init() : unit = {
    won <- false;
    gens <- [];
  }

  proc gen() : bool = {
    var x : int;
    if (size gens < n) {
      x <$ [1 .. upp];
      if (mem gens x) {
        won <- true;
      }
      gens <- x :: gens;
    }
    return won;
  }

  proc add(x : int) : unit = {
    if (size gens < n /\ 1 <= x <= upp) {
      gens <- x :: gens;
    }
  }
}.

module type ADV (O : OR) = {
  proc * main() : unit {O.gen O.add}
}.

module G(Adv : ADV) = {
  proc main() : unit = {
    Or.init();
    Adv(Or).main();
  }
}.

lemma G_FEL (Adv <: ADV{Or}) &m :
  Pr[G(Adv).main() @ &m : Or.won] <= (n * (n - 1))%r / (2 * upp)%r.
proof.
dump "1-1" 67
  (fel
     1
     (size Or.gens)
     (fun ctr => ctr%r * (1%r / upp%r))
     n
     Or.won
     [Or.gen : (size Or.gens < n);
      Or.add : (size Or.gens < n /\ 1 <= x <= upp)]
     (size Or.gens <= n)).
rewrite -mulr_suml sumidE 1:ge0_n /#.
trivial.
inline Or.init; auto; smt.
proc; wp;
  conseq (_ : _ ==> _ : 0%r);
  [smt ml=0 w=(size_ge0 ge1_upp) | hoare; auto].
move=> c; proc; rcondt 1; [auto | auto; smt].
move=> b c; proc; rcondf 1; [auto | auto; smt].
proc; if.
  wp; rnd (fun y => mem Or.gens y); skip; progress.
  rewrite mu_dinter max_ler; first smt ml=0 w=(ge1_upp).
  rewrite -addzA /= ler_pmul2r; first smt ml=0 w=(ge1_upp).
  rewrite size_filter le_fromint
          (count_mem_size Or.gens{hr} (range 1 (upp + 1))) range_uniq.
  smt ml=0.
  conseq (_ : _ ==> _ : 0%r); [smt ml=0 w=(size_ge0 ge1_upp) | hoare; auto].
move=> c; proc; rcondt 1; [auto | auto; smt].
move=> b c; proc; rcondf 1; auto.
qed.
