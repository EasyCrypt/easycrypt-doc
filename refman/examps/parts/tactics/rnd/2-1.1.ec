Type variables: <none>

n : int
#\hrulefill\hspace*{.5cm}#
&1 (left ) : M.h
&2 (right) : N.h

pre = y{2} = n

                           (1)  y <- y - 1               

post =
  (forall (xR : int),
     in_supp xR [2..3] => xR = if xR = 3 then 3 else 2) &&
  (forall (xR : int),
     in_supp xR [2..3] => mu_x [2..3] xR = mu_x {0,1} (xR = 3)) &&
  forall (xL : bool),
    in_supp xL {0,1} =>
    in_supp (if xL then 3 else 2) [2..3] &&
    xL = ((if xL then 3 else 2) = 3) &&
    (xL <=> (if xL then 3 else 2) + y{2} = n + 2)
