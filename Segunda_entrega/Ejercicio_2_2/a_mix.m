function [valor] = a_mix(R,T,Tc,Pc,w,k,composicion)
a=0;
for i=1:length(composicion)
    for j=1:length(composicion)
        a=a+composicion(i)*composicion(j)*...
            ((a_min(R,T,Tc(i),Pc(i),w(i))*a_min(R,T,Tc(j),Pc(j),w(j)))^0.5)*(1-k(i,j));

    end
end

valor=a;
end