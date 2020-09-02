function [T_rocio] = temperatura_rocio(R,P,Tc,Pc,w,k,z,semilla)

    T_rocio=raices_z(@(T)NR_Flash(R,T,P,Tc,Pc,w,k,z,1),semilla);
end

