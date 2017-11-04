Type variables: <none>

------------------------------------------------------------
&1 (left ) : M.f [programs are in sync]
&2 (right) : M.f

pre = ={M.y} /\ M.y{1} = 3

(1)  M.y <- M.y + 1           
(2)  M.x <- 0                 
(3)  M.x <- M.x + 1           
(4)  M.y <- M.y + 1           

post = ={M.y} /\ M.y{1} = 5
