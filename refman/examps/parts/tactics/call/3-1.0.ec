Type variables: <none>

Adv: T{Or}
#\hrulefill\hspace*{.5cm}#
&1 (left ) : M(Adv).h
&2 (right) : N(Adv).h

pre = ={glob Adv} /\ Or.x{1} %% 2 = Or.x{2} %% 2

z <@ Adv(Or).g()           (1)  z <@ Adv(Or).g()         

post = ={z}
