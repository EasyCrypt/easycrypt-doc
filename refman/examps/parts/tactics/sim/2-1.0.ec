Type variables: <none>

#\hrulefill\hspace*{.5cm}#
&1 (left ) : M.h
&2 (right) : N.h

pre = true

k <- 0                     (1--)  k <- 0                   
M.x <- 0                   (2--)  N.x <- 0                 
M.i <- 0                   (3--)  N.i <- 0                 
M.j <- 0                   (4--)  N.j <- 0                 
while (k < 10) {           (5--)  while (k < 10) {         
  M.f()                    (5.1)    N.f()                  
  k <- k + 1               (5.2)    k <- k + 1             
}                          (5--)  }                        
while (k < 20) {           (6--)  while (k < 20) {         
  M.g()                    (6.1)    N.g()                  
  k <- k + 1               (6.2)    k <- k + 1             
}                          (6--)  }                        

post = `|M.x{1} + k{1}| = `|N.x{2} - k{2}|
