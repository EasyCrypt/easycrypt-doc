require import Bool Int.

module M = {
  var x : int

  proc f() : unit = {
    x = x + 1;
  }
}.

module N = {
  var x : int

  proc g(n : int) : bool = {
    M.f();
    M.x <- M.x + x + n;
    return M.x > 0;
  }

  proc h = M.f
}.
