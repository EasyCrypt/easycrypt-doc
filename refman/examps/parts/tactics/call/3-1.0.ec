Type variables: <none>

Adv: T{Or}
#\hrulefill\hspace*{.5cm}#
&1 (left ) : M(Adv).h
&2 (right) : N(Adv).h

pre = ={y, glob Adv} /\ Or.x{1} %% 2 = 0 /\ Or.x{2} %% 2 = 0

Adv(Or).g()                (1)  Adv(Or).g()              

post = Or.x{1} %% 2 = 0 /\ Or.x{2} %% 2 = 0
