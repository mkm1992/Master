omega = max(0,omega - omega_step* (Pmax - sum(pOpt)));
for ki=1:K
    ro(ki)= max(0,ro(ki) - ro_step* (r(ki) - Rt));
end