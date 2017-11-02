require import Bool DBool Int IntDiv.

module M = {
  var x : int

  proc f(b : bool) : bool = {
    var b' : bool;
    x <- x + 2;
    b' <$ {0,1};
    b <- b /\ b';
    return b;
  }
}.

module N = {
  var y : int

  proc f(b : bool) : bool = {
    var b' : bool;
    y <- y - 2;
    b' <$ {0,1};
    b <- b /\ b';
    return b;
  }
}.

lemma M_N_1 :
  equiv[M.f ~ N.f :
        ={b} /\ M.x{1} %% 2 + N.y{2} %% 2 = 0 ==>
        ={res} /\ M.x{1} %% 2 + N.y{2} %% 2 = 0].
proof.
proc.
dump "2-1" 67
  (conseq (_ : ={b} ==> ={b})
          (_ : M.x %% 2 = 0 ==> M.x %% 2 = 0)
          (_ : N.y %% 2 = 0 ==> N.y %% 2 = 0)).
smt.
smt.
auto; smt.
auto; smt.
auto; smt.
qed.

lemma M_N_2 :
  equiv[M.f ~ N.f :
        ={b} /\ M.x{1} %% 2 + N.y{2} %% 2 = 0 ==>
        ={res} /\ M.x{1} %% 2 + N.y{2} %% 2 = 0].
proof.
dump "2-2" 67
  (conseq (_ : ={b} ==> ={res})
          (_ : M.x %% 2 = 0 ==> M.x %% 2 = 0)
          (_ : N.y %% 2 = 0 ==> N.y %% 2 = 0)).
smt.
smt.
proc; auto; smt.
proc; auto; smt.
proc; auto; smt.
qed.

lemma M_N : equiv[M.f ~ N.f : ={b} ==> ={res}].
proof. proc; auto; smt. qed.

lemma M : hoare[M.f : M.x %% 2 = 0 ==> M.x %% 2 = 0].
proof. proc; auto; smt. qed.

lemma N : hoare[N.f : N.y %% 2 = 0 ==> N.y %% 2 = 0].
proof. proc; auto; smt. qed.

lemma M_N_3 :
  equiv[M.f ~ N.f :
        ={b} /\ M.x{1} %% 2 + N.y{2} %% 2 = 0 ==>
        ={res} /\ M.x{1} %% 2 + N.y{2} %% 2 = 0].
dump "2-3" 67 (conseq M_N M N).
smt.
smt.
qed.
