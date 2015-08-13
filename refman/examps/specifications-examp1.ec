require import Int Bool Distr.

module M = {
  var x : int
    
  proc init(bnd : int) : unit = {
    x <$ [-bnd .. bnd];
  }
    
  proc incr(n : int) : unit = {
    x <- x + n;
  }
    
  proc get() : int = {
    return x;
  }
    
  proc main() : bool = {
    var n : int;
    init(100);
    incr(10);
    incr(-50);
    n <@ get();
    return n < 0;
  }
}.
