Type variables: <none>

x : int
zor1_x: x = 1 \/ x = 2
#\hrulefill\hspace*{.5cm}#
Context : M.f

pre = y %% 3 = x

(1--)  if (y %% 3 = 1) {        
(1.1)    y <- y + 4             
(1--)  } else {                 
(1?1)    y <- y + 2             
(1--)  }                        

post = y %% 3 = x %% 2 + 1
