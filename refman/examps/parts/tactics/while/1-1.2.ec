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
   (x{1} > 0 <=> i{2} <= x{2})) /\
  forall (z_L x_L i_R z_R : int),
    ! x_L > 0 =>
    ! i_R <= x{2} =>
    x_L - 1 = x{2} - i_R /\ z_L * 2 + 1 = z_R =>
    (z_L + y{1} - n) * 2 + 1 = z_R + y{2} - n
