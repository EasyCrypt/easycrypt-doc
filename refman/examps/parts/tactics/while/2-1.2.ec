Type variables: <none>

m : int
#\hrulefill\hspace*{.5cm}#
Context : M.f

pre = m = n /\ n >= 0

(1)  x <- 0                   
(2)  i <- 0                   

post =
  (0 <= i <= n /\ x <= i * i) /\
  forall (i0 x0 : int),
    ! i0 < n => 0 <= i0 <= n /\ x0 <= i0 * i0 => x0 <= m * m
