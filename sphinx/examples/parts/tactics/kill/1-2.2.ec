Type variables: <none>

------------------------------------------------------------
&1 (left ) : M.f
&2 (right) : M.f

pre = ={M.y} /\ M.y{1} = 3

M.y <- M.y + 1             (1)  M.y <- M.y + 1           
M.x <- 0                   (2)  M.y <- M.y + 1           
M.x <- M.x + 1             (3)                           
M.y <- M.y + 1             (4)                           

post = ={M.y} /\ M.y{1} = 5
