function [costo] = costo_ciclo(calor_evaporador,calor_condensador,potencia_compresor)

compresor=(903.6/280)*517*potencia_compresor^0.82*(2.11);
costo=compresor;
end

