Type variables: <none>

#\hrulefill\hspace*{.5cm}#
Context : M.f

pre = true

(1)  y <- 2                   

post = forall (x0 : int), (in_supp x0 [1..10])%Distr => 3 <= x0 + y <= 12
