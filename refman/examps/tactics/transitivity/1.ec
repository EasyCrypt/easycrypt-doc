require import Int List.

(* M and N only differ in their procedure and variable names; this is
   to clarify the use of the side-argument to transitivity *)

module M = {
  proc f(n : int, m : int) : int = {
    var i, x : int;
    i <- 0; x <- 0;
    while (i < n) {
      x <- x + m;
      i <- i + 1;
    }
    return x;
  }
}.

module N = {
  proc g(n : int, m : int) : int = {
    var j, y : int;
    j <- 0; y <- 0;
    while (j < n) {
      y <- y + m;
      j <- j + 1;
    }
    return y;
  }
}.

module R = {
  proc h(n : int, m : int) : int = {
    return n * m;
  }
}.

lemma X :
  equiv[M.f ~ N.g :
        0 <= n{1} /\ 0 <= n{2} /\ n{1} = m{2} /\ m{1} = n{2} ==> ={res}].
proof.
dump "1-1" 67
  (transitivity
     R.h
     (0 <= n{1} /\ (n * m){1} = (n * m){2} ==> ={res})
     (0 <= n{2} /\ (n * m){1} = (n * m){2} ==> ={res})).
smt.
trivial.
proc; sp=> /=;
  while{1}
    (0 <= i{1} <= n{1} /\ x{1} = i{1} * m{1})
    (n{1} - i{1}); auto; smt.
proc; sp;
  while{2}
    (0 <= j{2} <= n{2} /\ y{2} = j{2} * m{2})
    (n{2} - j{2}); auto; smt.
qed.

lemma Y1 :
  equiv[M.f ~ N.g :
        0 <= n{1} /\ 0 <= n{2} /\ n{1} = m{2} /\ m{1} = n{2} ==> ={res}].
proof.
proc; sp=> /=.
dump "1-2" 67
  (transitivity{1}
     {x <- n * m;}
     (0 <= n{1} /\ i{1} = 0 /\ x{1} = 0 /\ (n * m){1} = (n * m){2} ==> ={x})
     (0 <= n{2} /\ j{2} = 0 /\ y{2} = 0 /\ (n * m){1} = (n * m){2} ==>
      x{1} = y{2})).
smt.
trivial.
while{1}
  (0 <= i{1} <= n{1} /\ x{1} = i{1} * m{1})
  (n{1} - i{1}); auto; smt.
while{2}
  (0 <= j{2} <= n{2} /\ y{2} = j{2} * m{2})
  (n{2} - j{2}); auto; smt.
qed.

lemma L2 :
  equiv[M.f ~ N.g :
        0 <= n{1} /\ 0 <= n{2} /\ n{1} = m{2} /\ m{1} = n{2} ==> ={res}].
proof.
proc; sp=> /=.
dump "1-3" 67
  (transitivity{2}
     {y <- n * m;}
     (0 <= n{1} /\ i{1} = 0 /\ x{1} = 0 /\ (n * m){1} = (n * m){2} ==>
      x{1} = y{2})
     (0 <= n{2} /\ j{2} = 0 /\ y{2} = 0 /\ (n * m){1} = (n * m){2} ==> ={y})).
smt.
trivial.
while{1}
  (0 <= i{1} <= n{1} /\ x{1} = i{1} * m{1})
  (n{1} - i{1}); auto; smt.
while{2}
  (0 <= j{2} <= n{2} /\ y{2} = j{2} * m{2})
  (n{2} - j{2}); auto; smt.
qed.
