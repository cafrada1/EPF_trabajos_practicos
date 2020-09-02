function [valor] = b_mix(R,Tc,Pc,composicion)
b=0;
for i=1:length(composicion)
    b=b+b_min(R,Tc(i),Pc(i))*composicion(i);
end
valor=b;
end

