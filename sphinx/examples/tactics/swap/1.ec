module M = {
  var x, y, z, w : bool
  proc f() : unit = {
    x <- true;
    y <- false;
    z <- true;
    w <- false;
  }
}.

lemma X :
  equiv[M.f ~ M.f :
        ={M.x, M.y, M.z, M.w} ==>
        ={M.x, M.y, M.z, M.w}].
proof.
proc.
dump "1-1" (swap 1 3 4).
dump "1-2" (swap 2 2).
dump "1-3" (swap{1} [3 .. 4] -1).
dump "1-4" (swap 2).
dump "1-5" (swap{2} -1).
auto; smt.
qed.
