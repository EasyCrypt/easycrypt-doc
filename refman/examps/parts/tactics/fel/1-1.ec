fel
     1
     (size Or.gens)
     (fun ctr => ctr%r * (1%r / upp%r))
     n
     Or.won
     [Or.gen : (size Or.gens < n);
      Or.add : (size Or.gens < n /\ 1 <= x <= upp)].
