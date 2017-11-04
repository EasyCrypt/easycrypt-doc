Type variables: <none>

Adv: T{Or}
------------------------------------------------------------
pre = true /\ Or.x{1} %% 2 = 0 /\ Or.x{2} %% 2 = 0

    Or.f2 ~ Or.f2

post = ={res} /\ Or.x{1} %% 2 = 0 /\ Or.x{2} %% 2 = 0
