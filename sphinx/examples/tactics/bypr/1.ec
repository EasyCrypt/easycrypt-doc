require import Bool DBool.

module M = {
  var x : bool
  proc f(y : bool) : bool = {
    var b : bool;
    b <$ {0,1};
    return b /\ y;
  }
}.

module N = {
  var x : bool
  proc f(y : bool) : bool = {
    var b, b' : bool;
    b <$ {0,1};
    b' <$ {0,1};
    return (b ^^ b') /\ y;
  }
}.

lemma L :
  equiv[M.f ~ N.f :
        ={y} /\ M.x{1} = N.x{2} ==>
        (res /\ M.x){1} = (res /\ N.x){2}].
proof.
dump "1-1" 67 (bypr (res, M.x){1} (res, N.x){2}).
trivial.
move=> &1 &2 a [y_eq x_eq].
byequiv (_ : ={y} /\ M.x{1} = N.x{2} ==> (res, M.x){1} = (res, N.x){2}).
proc.
seq 0 1 : (={y} /\ M.x{1} = N.x{2}); first auto; smt.
rnd (fun z => z ^^ b{2}); skip; smt.
trivial.
trivial.
qed.
