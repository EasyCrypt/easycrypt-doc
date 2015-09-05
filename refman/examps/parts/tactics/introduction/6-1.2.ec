Type variables: <none>

x : bool
y : bool
Hy: y
_ : x => forall (z : bool), P x z
HQ: y => forall (z w : bool), Q y z w
#\hrulefill\hspace*{.5cm}#
(forall (z : bool), P x z) \/ forall (z w : bool), Q y z w
