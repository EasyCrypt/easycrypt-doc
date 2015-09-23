Type variables: <none>

x2: int
#\hrulefill\hspace*{.5cm}#
&1 (left ) : M.g
&2 (right) : N.g

pre = x2 = N.x{2} /\ N.x{2} = u{2} /\ u{1} %% 2 = u{2} %% 2

M.x <- u                   (1)                           
M.f(7)                     (2)                           

post = (M.x{1} %% 2 = 0) = (N.x{2} %% 2 = 0)
