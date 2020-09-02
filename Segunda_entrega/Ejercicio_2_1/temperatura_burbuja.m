function [T_burbuja] = temperatura_burbuja(R,P,Tc,Pc,w,k,z,semilla)

    T_burbuja=raices_z(@(T)NR_Flash(R,T,P,Tc,Pc,w,k,z,0),semilla);
end

