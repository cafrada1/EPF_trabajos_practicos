function [Constantes] = Cp(Compuesto)
switch Compuesto
    
    case "Nitrogeno"
        load('Nitrogeno_cp.mat');
    case "Argon"
        load('Argon_cp.mat');
    case "Propano"
        load('Propano_cp.mat');
    case "Metano"
        load('Metano_cp.mat');
end
        

end

