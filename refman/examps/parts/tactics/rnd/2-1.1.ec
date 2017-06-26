Type variables: <none>

n : int
#\hrulefill\hspace*{.5cm}#
&1 (left ) : M.h
&2 (right) : N.h

pre = y{2} = n

                           (1)  y <- y - 1               

post =
  (forall (xR : int),
     xR \in [2..3] => xR = if xR = 3 then 3 else 2) &&
  (forall (xR : int),
     xR \in [2..3] => mu1 [2..3] xR = mu1 {0,1} (xR = 3)) &&
  forall (xL : bool),
    xL \in {0,1} =>
    ((if xL then 3 else 2) \in [2..3]) &&
    xL = ((if xL then 3 else 2) = 3) &&
    (xL <=> (if xL then 3 else 2) + y{2} = n + 2)
