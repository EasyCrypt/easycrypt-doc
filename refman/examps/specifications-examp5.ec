require import Bool Int Distr.

module type OR = {
  proc init(secret tries : int) : unit
  proc guess(guess : int) : unit
  proc guessed() : bool
}.

module Or : OR = {
  var sec : int
  var tris : int
  var guessed : bool

  proc init(secret tries : int) : unit = {
    sec <- secret;
    tris <- tries;
    guessed <- false;
  }

  proc guess(guess : int) : unit = {
    if (tris > 0) {
      guessed <- guessed \/ (guess = sec);
      tris <- tris - 1;
    }
  }

  proc guessed() : bool = {
    return guessed;
  }
}.

module type ADV(O : OR) = {
  proc * chooseRange() : int * int {}
  proc doGuessing() : unit {O.guess}
}.

module SimpAdv(O : OR) : ADV(O) = {
  var range : int * int
  var tries : int

  proc chooseRange() : int * int = {
    range <- (1, 100);
    tries <- 10;
    return range;
  }

  proc doGuessing() : unit = {
    var x : int;
    while (tries > 0) {
      x <$ [range.`1 .. range.`2];
      O.guess(x);
      tries <- tries - 1;
    }
  }
}.

module type GAME = {
  proc main() : bool
}.

module Game(Adv : ADV) : GAME = {
  module A = Adv(Or)

  proc main() : bool = {
    var low, high, tries, secret : int;
    var advWon : bool;
    (low, high) <@ A.chooseRange();
    if (high - low < 10)
      advWon <- false;
    else {
      tries <- (high - low + 1) /% 10;       (* /% is integer division *)

      secret <$ [low .. high];
      Or.init(secret, tries);
      A.doGuessing();
      advWon <@ Or.guessed();
    }
    return advWon;
  }
}.

module SimpGame = Game(SimpAdv).
