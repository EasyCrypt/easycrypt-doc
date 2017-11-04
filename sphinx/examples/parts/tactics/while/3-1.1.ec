Type variables: <none>

------------------------------------------------------------
forall _ (z : int),
  phoare[ x <- x + (i + 1); i <- i + 1 :
           ((0 <= i <= n /\ x <= i * i) /\ i < n) /\ n - i = z ==>
           (0 <= i <= n /\ x <= i * i) /\ n - i < z] = 1%r
