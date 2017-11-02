require import Bool Int Distr.

module type OR = {
  proc init(secret : int, tries : int) : unit
  proc guess(guess : int) : unit
  proc guessed() : bool
}.

module Or = {
  var sec : int
  var tris : int
  var guessed : bool

  proc init(secret, tries : int) : unit = {
    sec <- secret;
    tris <- tries;
    guessed <- false;
  }

  proc guess(guess : int) : unit = {
    if (0 < tris) {
      guessed <- guessed \/ (guess = sec);
      tris <- tris - 1;
    }
  }

  proc guessed() : bool = {
    return guessed;
  }
}.
