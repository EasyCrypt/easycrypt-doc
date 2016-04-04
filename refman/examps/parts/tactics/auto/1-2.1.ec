Type variables: <none>

#\hrulefill\hspace*{.5cm}#
forall &hr,
  1 <= y{hr} < x{hr} =>
  forall (z1 : int),
    in_supp z1 [x{hr}..y{hr}] =>
    forall (z2 : int), in_supp z2 [x{hr} - 1..y{hr} + 1] => 0 <= z1 + z2
