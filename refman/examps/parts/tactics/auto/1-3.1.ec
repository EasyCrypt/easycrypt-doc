Type variables: <none>

#\hrulefill\hspace*{.5cm}#
forall &1 &2,
  ={x, y} /\ 1 < x{1} <= y{2} =>
  if y{1} < x{1} then
    (forall (z1R : int), z1R \in [x{2}..y{2}] => z1R = z1R) &&
    (forall (z1R : int),
       z1R \in [x{2}..y{2}] => mu1 [x{2}..y{2}] z1R = mu1 [y{1}..x{1}] z1R) &&
    forall (z1L : int),
      z1L \in [y{1}..x{1}] =>
      (z1L \in [x{2}..y{2}]) &&
      z1L = z1L &&
      let x_R = x{2} - 1 in
      let y_R = y{2} + 1 in
      (forall (z2R : int), z2R \in [x_R..y_R] => z2R = z2R) &&
      (forall (z2R : int),
         z2R \in [x_R..y_R] =>
         mu1 [x_R..y_R] z2R = mu1 [y{1} - 1..x{1} + 1] z2R) &&
      forall (z2L : int),
        z2L \in [y{1} - 1..x{1} + 1] =>
        (z2L \in [x_R..y_R]) && z2L = z2L && z1L + z2L = z1L + z2L
  else
    (forall (z1R : int), z1R \in [x{2}..y{2}] => z1R = z1R) &&
    (forall (z1R : int),
       z1R \in [x{2}..y{2}] => mu1 [x{2}..y{2}] z1R = mu1 [x{1}..y{1}] z1R) &&
    forall (z1L : int),
      z1L \in [x{1}..y{1}] =>
      (z1L \in [x{2}..y{2}]) &&
      z1L = z1L &&
      let x_R = x{2} - 1 in
      let y_R = y{2} + 1 in
      (forall (z2R : int), z2R \in [x_R..y_R] => z2R = z2R) &&
      (forall (z2R : int),
         z2R \in [x_R..y_R] =>
         mu1 [x_R..y_R] z2R = mu1 [x{1} - 1..y{1} + 1] z2R) &&
      forall (z2L : int),
        z2L \in [x{1} - 1..y{1} + 1] =>
        (z2L \in [x_R..y_R]) && z2L = z2L && z1L + z2L = z1L + z2L
