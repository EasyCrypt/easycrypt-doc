Type variables: <none>

x : int
zor1_x: x = 1 \/ x = 2
#\hrulefill\hspace*{.5cm}#
Context : M.f

pre = x %% 3 = x

(1--)  if (x %% 3 = 1) {        
(1.1)    x <- x + 4             
(1--)  } else {                 
(1?1)    x <- x + 2             
(1--)  }                        

post = x %% 3 = x %% 2 + 1
