Type variables: <none>

Adv: ADV{Or}
&m: memory
#\hrulefill\hspace*{.5cm}#
pre =
  (((0 <= size Or.gens /\ size Or.gens < n) /\ !Or.won) /\
   size Or.gens <= n) /\
  size Or.gens < n

    Or.gen
    [<=] size Or.gens%r * (1%r / upp%r)

post = Or.won
