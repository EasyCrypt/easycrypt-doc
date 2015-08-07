require import Bool Int Distr.

module N = {
  proc loop() : int = {
    var y, z : int;
    y <- 0;
    while (y < 10) {
      z <$ [1 .. 10];
      if (z <= 5) {
        y <- y - z;
      }
      else {
        y <- y + (z - 5);
      }
    }
    return y;
  }
}.


