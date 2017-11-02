require import Int.

module M = {
  var x, y : int
  proc f(z : int) : unit = {
    if (z <= x \/ z <= y) {
      x = x + 1;
    }
  }
}.

module N = {
  var x, y : int
  proc f(z : int) : unit = {
    if (z <= x) {
      x = x - 1;
    }
  }
}.

lemma M_N_1 :
 equiv[M.f ~ N.f :
        ={z} /\ M.x{1} = N.x{2} /\ M.y{1} = N.y{2} /\
        z{1} < M.x{1} /\ z{1} < M.y{1} ==>
        M.y{1} = N.y{2} /\ `|M.x{1} - N.x{2}| <= 2].
proof.
proc.
dump "1-1" 67
  (conseq (_ :
           ={z} /\ M.x{1} = N.x{2} /\ M.y{1} = N.y{2} /\
           z{1} <= M.x{1} /\ z{1} <= M.y{1} ==> _)).
smt.
dump "1-2" (conseq (_ : _ ==> `|M.x{1} - N.x{2}| <= 2)).
smt.
dump "1-3" 67
  (conseq (_ :
           ={z} /\ M.x{1} = N.x{2} /\ z{1} <= N.x{2} ==>
           M.x{1} = N.x{2} \/ M.x{1} = N.x{2} + 2)).
smt.
smt.
auto; smt.
qed.

lemma M_N_2 :
 equiv[M.f ~ N.f :
        ={z} /\ M.x{1} = N.x{2} /\ M.y{1} = N.y{2} /\
        z{1} < M.x{1} /\ z{1} < M.y{1} ==>
        M.y{1} = N.y{2} /\ `|M.x{1} - N.x{2}| <= 2].
proof.
dump "1-4" 67
  (conseq (_ :
           ={z} /\ M.x{1} = N.x{2} /\ M.y{1} = N.y{2} /\
           z{1} <= M.x{1} /\ z{1} <= M.y{1} ==> _)).
smt.
dump "1-5" (conseq (_ : _ ==> `|M.x{1} - N.x{2}| <= 2)).
smt.
dump "1-6" 67
  (conseq (_ :
           ={z} /\ M.x{1} = N.x{2} /\ z{1} <= N.x{2} ==>
           M.x{1} = N.x{2} \/ M.x{1} = N.x{2} + 2)).
smt.
smt.
proc; auto; smt.
qed.

lemma M_N_3 :
  equiv[M.f ~ N.f :
        ={z} /\ M.x{1} = N.x{2} /\ z{1} <= N.x{2} ==>
        M.x{1} = N.x{2} \/ M.x{1} = N.x{2} + 2].
proof. proc; auto; smt. qed.

lemma M_N_4 :
  equiv[M.f ~ N.f :
        ={z} /\ M.x{1} = N.x{2} /\ M.y{1} = N.y{2} /\
        z{1} < M.x{1} /\ z{1} < M.y{1} ==>
        M.y{1} = N.y{2} /\ `|M.x{1} - N.x{2}| <= 2].
proof.
dump "1-7" 67 (conseq M_N_3).
smt.
smt.
qed.

lemma M_1 (x' : int) :
  hoare[M.f : x' = M.x /\ z < M.x /\ z < M.y ==> x' < M.x].
proof.
proc.
dump "1-8" 67 (conseq (_ : x' = M.x /\ z <= M.y ==> x' = M.x - 1)).
smt.
smt.
auto; smt.
qed.

lemma M_2 (x' : int) :
  hoare[M.f : x' = M.x /\ z < M.x /\ z < M.y ==> x' < M.x].
proof.
dump "1-9" 67 (conseq (_ : x' = M.x /\ z <= M.y ==> x' = M.x - 1)).
smt.
smt.
proc; auto; smt.
qed.

lemma M_3 (x' : int) :
  hoare[M.f : x' = M.x /\ z <= M.y ==> x' = M.x - 1].
proof. proc; auto; smt. qed.

lemma M_4 (x' : int) :
  hoare[M.f : x' = M.x /\ z < M.x /\ z < M.y ==> x' < M.x].
proof.
dump "1-10" 67 (conseq (M_3 x')).
smt.
smt.
qed.
