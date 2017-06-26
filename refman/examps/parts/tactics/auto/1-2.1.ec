Type variables: <none>

#\hrulefill\hspace*{.5cm}#
forall &hr,
  1 <= y{hr} < x{hr} =>
  forall (z1 : int),
    z1 \in [x{hr}..y{hr}] =>
    forall (z2 : int), z2 \in [x{hr} - 1..y{hr} + 1] => 0 <= z1 + z2
