Type variables: <none>

x : bool
y : bool
Hx: x
HP: x => forall (z : bool), P x z
_ : y => forall (z w : bool), Q y z w
------------------------------------------------------------
(forall (z : bool), P x z) \/ forall (z w : bool), Q y z w
