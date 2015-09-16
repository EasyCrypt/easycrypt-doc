Type variables: <none>

#\hrulefill\hspace*{.5cm}#
Context : M.f

pre = x >= 0

(1)  n <- x                   
(2)  i <- 0                   

post =
  (i <= n /\ x + i = n) /\
  forall (i0 x0 : int),
    ! i0 < n => i0 <= n /\ x0 + i0 = n => x0 = 0
