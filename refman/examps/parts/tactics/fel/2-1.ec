fel
     1
     Or.ctr
     (fun ctr => ctr%r * (1%r / upp%r))
     n
     Or.won
     [Or.gen : (Or.ctr < n);
      Or.add : (Or.ctr < n /\ 1 <= x <= upp)]
     (Or.ctr = size Or.gens).
