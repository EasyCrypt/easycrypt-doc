Type variables: <none>

x : bool
y : bool
#\hrulefill\hspace*{.5cm}#
x \/ y =>
(x => forall (z : bool), P x z) =>
(y => forall (z w : bool), Q y z w) =>
(forall (z : bool), P x z) \/ forall (z w : bool), Q y z w
