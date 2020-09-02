R=8.314;
Tc=369.9;
Pc=4.257;
w=0.152;
T=250;

P_inicial=0.3;

funcion=@(P)ajuste_presion_vapor(P,T,R,Tc,Pc,w);

presion_vapor=raices_z(funcion,P_inicial);