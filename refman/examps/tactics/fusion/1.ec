require import Bool Int.

module M = {
  proc f(n : int) : int = {
    var i, j, x, y : int;
    x <- 0; y <- 0;
    i <- 0; j <- 0;
    while (i + j < n) {
      x <- x * i;
      x <- x + (j + 1);
      y <- y * j;
      y <- y + (i + 2);
      i <- i + 1; j <- j + 2;
    }
    return x + y;
  }
}.

lemma X : hoare[M.f : n > 0 ==> res > 0].
proof.
proc.
fission 5!2 @ 2, 4.
dump "1-1" (fusion 5!2 @ 2, 2).
admit.
qed.
