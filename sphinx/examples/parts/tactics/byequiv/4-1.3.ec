Type variables: <none>

&m: memory
#\hrulefill\hspace*{.5cm}#
forall &1 &2,
  M.bad{1} = N.bad{2} /\ (!N.bad{2} => ={res}) =>
  (M.bad{1} <=> N.bad{2}) /\ (!N.bad{2} => res{1} <=> res{2})
