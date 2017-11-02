require import Bool Int.

module M = {
  var x : int

  proc f() : unit = {
    x <- x + 1;
  }
}.

module N = {
  var x : int

  proc g(n m : int, b : bool) : bool = {
    if (b) M.f();
    M.x <- M.x + x + n - m;
    return 0 < M.x;
  }

  proc h = M.f
}.
