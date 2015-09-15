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
dump "4-1" (proc*).
call (_ : true).
auto.
skip; trivial.
qed.

