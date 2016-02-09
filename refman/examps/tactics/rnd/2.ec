require import Int Bool DBool DInterval.

module M = {
  proc h() : bool = {
    var x : bool;
    x <$ {0,1};
    return x;
  }
}.

module N = {
  proc h(y : int) : int = {
    var x : int;
    y <- y - 1;
    x <$ [2 .. 3];
    return x + y;
  }
}.

lemma X (n : int) :
  equiv[M.h ~ N.h : y{2} = n ==> res{1} <=> res{2} = n + 2].
proof.
proc.
dump "2-1" 67 (rnd (fun b => b ? 3 : 2) (fun m => m = 3)).
auto; smt.
qed.



