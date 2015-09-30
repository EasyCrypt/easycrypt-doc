Type variables: <none>

#\hrulefill\hspace*{.5cm}#
&1 (left ) : M.f
&2 (right) : M.f

pre = ={M.y} /\ M.y{1} = 3

M.y <- M.y + 1             (1)  M.y <- M.y + 1           
M.x <- 0                   (2)  M.x <- 0                 
M.x <- M.x + 1             (3)  M.x <- M.x + 1           
M.y <- M.y + 1             (4)  M.y <- M.y + 1           

post = ={M.y} /\ M.y{1} = 5
