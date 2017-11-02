require import Int.

module G1 = {
  proc f(x : int, y : int) : int = {
    x = x + 1;
    y = y + 1;
    return x + y;
  }
}.

module G2 = {
  proc f(x : int, y : int) : int = {
    y = y + 1;
    x = x + 1;
    return x + y;
  }
}.

lemma G1_G2_f : equiv[G1.f ~ G2.f : ={x,y} ==> ={res}].
proof.
proc.
simplify.
dump "1-1" (seq 1 1 : (x{1} = x{2} + 1 /\ y{2} = y{1} + 1)).
auto.
auto.
qed.
