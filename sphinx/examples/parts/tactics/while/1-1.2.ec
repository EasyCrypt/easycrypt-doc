Type variables: <none>

n : int
#\hrulefill\hspace*{.5cm}#
&1 (left ) : M.f
&2 (right) : N.f

pre = ={x, y} /\ y{1} = n

z <- 0                     (1)  z <- 1                   
                           (2)  i <- 1                   

post =
  ((x{1} - 1 = x{2} - i{2} /\ z{1} * 2 + 1 = z{2}) /\
   (0 < x{1} <=> i{2} <= x{2})) /\
  forall (x_L z_L i_R z_R : int),
    ! 0 < x_L =>
    ! i_R <= x{2} =>
    x_L - 1 = x{2} - i_R /\ z_L * 2 + 1 = z_R =>
    (z_L + y{1} - n) * 2 + 1 = z_R + y{2} - n
