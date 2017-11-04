Type variables: <none>

M : T{Or}
------------------------------------------------------------
pre = true /\ Or.x{1} %% 2 = 0 /\ Or.x{2} %% 2 = 0

    Or.f1 ~ Or.f1

post = ={res} /\ Or.x{1} %% 2 = 0 /\ Or.x{2} %% 2 = 0
