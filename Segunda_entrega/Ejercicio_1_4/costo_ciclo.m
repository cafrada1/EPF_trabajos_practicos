function [costo] = costo_ciclo(potencia_compresor)

compresor=(903.6/280)*517*potencia_compresor^0.82*(2.11);
costo=compresor;
end

