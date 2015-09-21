Type variables: <none>

x_2: int
#\hrulefill\hspace*{.5cm}#
&1 (left ) : M.g
&2 (right) : N.g

pre = x_2 = N.x{2} /\ N.x{2} = u{2} /\ u{1} %% 2 = u{2} %% 2

M.x <- u                   (1)                           

post =
  M.x{1} %% 2 = x_2 %% 2 &&
  forall (x_L : int),
    x_L %% 2 = x_2 %% 2 => (x_L %% 2 = 0) = (N.x{2} %% 2 = 0)
