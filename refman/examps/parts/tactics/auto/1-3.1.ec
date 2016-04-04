Type variables: <none>

#\hrulefill\hspace*{.5cm}#
forall &1 &2,
  ={x, y} /\ 1 < x{1} <= y{2} =>
  if y{1} < x{1} then
    (forall (z1R : int), in_supp z1R [x{2}..y{2}] => z1R = z1R) &&
    (forall (z1R : int),
       in_supp z1R [x{2}..y{2}] =>
       mu_x [x{2}..y{2}] z1R = mu_x [y{1}..x{1}] z1R) &&
    forall (z1L : int),
      in_supp z1L [y{1}..x{1}] =>
      in_supp z1L [x{2}..y{2}] &&
      z1L = z1L &&
      let x_R = x{2} - 1 in
      let y_R = y{2} + 1 in
      (forall (z2R : int), in_supp z2R [x_R..y_R] => z2R = z2R) &&
      (forall (z2R : int),
         in_supp z2R [x_R..y_R] =>
         mu_x [x_R..y_R] z2R = mu_x [y{1} - 1..x{1} + 1] z2R) &&
      forall (z2L : int),
        in_supp z2L [y{1} - 1..x{1} + 1] =>
        in_supp z2L [x_R..y_R] && z2L = z2L && z1L + z2L = z1L + z2L
  else
    (forall (z1R : int), in_supp z1R [x{2}..y{2}] => z1R = z1R) &&
    (forall (z1R : int),
       in_supp z1R [x{2}..y{2}] =>
       mu_x [x{2}..y{2}] z1R = mu_x [x{1}..y{1}] z1R) &&
    forall (z1L : int),
      in_supp z1L [x{1}..y{1}] =>
      in_supp z1L [x{2}..y{2}] &&
      z1L = z1L &&
      let x_R = x{2} - 1 in
      let y_R = y{2} + 1 in
      (forall (z2R : int), in_supp z2R [x_R..y_R] => z2R = z2R) &&
      (forall (z2R : int),
         in_supp z2R [x_R..y_R] =>
         mu_x [x_R..y_R] z2R = mu_x [x{1} - 1..y{1} + 1] z2R) &&
      forall (z2L : int),
        in_supp z2L [x{1} - 1..y{1} + 1] =>
        in_supp z2L [x_R..y_R] && z2L = z2L && z1L + z2L = z1L + z2L
