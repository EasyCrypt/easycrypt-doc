Type variables: <none>

M : T{Or}
------------------------------------------------------------
pre = ={glob M} /\ Or.x{1} %% 2 = 0 /\ Or.x{2} %% 2 = 0

    M(Or).g ~ M(Or).g

post = Or.x{1} %% 2 = 0 /\ Or.x{2} %% 2 = 0
