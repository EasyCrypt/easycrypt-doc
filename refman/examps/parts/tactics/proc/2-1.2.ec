Type variables: <none>

M : T{Or}
#\hrulefill\hspace*{.5cm}#
forall &1 &2,
  ={res} /\ ={glob M} /\ ={Or.x} /\ Or.x{1} %% 2 = 0 =>
  ={res, Or.x} /\ Or.x{1} %% 2 = 0
