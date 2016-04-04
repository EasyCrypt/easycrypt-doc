Type variables: <none>

#\hrulefill\hspace*{.5cm}#
forall &hr,
  1 <= y{hr} < x{hr} =>
  if y{hr} < x{hr} then
    forall (z1 : int),
      in_supp z1 [y{hr}..x{hr}] =>
      forall (z2 : int),
        in_supp z2 [y{hr} - 1..x{hr} + 1] => 0 <= z1 + z2
  else
    forall (z1 : int),
      in_supp z1 [x{hr}..y{hr}] =>
      forall (z2 : int),
        in_supp z2 [x{hr} - 1..y{hr} + 1] => 0 <= z1 + z2
