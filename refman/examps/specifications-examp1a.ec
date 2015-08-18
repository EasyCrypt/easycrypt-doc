require import Int Bool Distr.

module M' = {
  var x : int
    
  proc init(bnd) = {
    x <$ [-bnd .. bnd];
  }
    
  proc incr(n) = {
    x <- x + n;
  }
    
  proc get() = {
    return x;
  }
    
  proc main() = {
    var n;
    init(100);
    incr(10); incr(-50);
    n <@ get();
    return n < 0;
  }
}.
