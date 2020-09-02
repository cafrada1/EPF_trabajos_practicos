function [coeficiente] = coeficiente_fugacidad_mix(R,T,Tc,P,Pc,w,k,composicion,z0,indice)
format long
z=factor_z(R,T,Tc,P,Pc,w,k,composicion,z0);

B_mix=B_may_mix(R,T,Tc,P,Pc,composicion);

A_mix=A_may_mix(R,T,Tc,P,Pc,w,k,composicion);

B=[];
A=[];

for i=1:length(composicion)
    B(i)=B_may(R,T,Tc(i),P,Pc(i));
    for j=1:length(composicion)
        A(i,j)=((a_min(R,T,Tc(i),Pc(i),w(i))*a_min(R,T,Tc(j),Pc(j),w(j)))^0.5)*(1-k(i,j))*P/(R*T)^2;
    end
end

termino=2*composicion*A(:,indice);

coeficiente=exp(((B(indice)/B_mix)*(z-1))-...
    log(z-B_mix)-...
    (A_mix/(B_mix*8^0.5))*...
    ((termino/A_mix)-(B(indice)/B_mix))*...
    log((z+B_mix*(1+2^0.5))/(z+B_mix*(1-2^0.5))));

end

