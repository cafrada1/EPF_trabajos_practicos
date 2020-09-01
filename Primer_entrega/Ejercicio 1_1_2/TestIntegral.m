%{
1) Calcula los gamma para los valores experimentales extrapolando linealmente para dilucion infinita. 
3) Calcula el logaritmo de cada gamma.
4) Calcula las areas mediante la regla de trapecios.
5) Estima el error.
6) Define si los parametros son consistentes termodinamicamente.
%}
clear Gamma1 Gamma2
x1_experimental=x1(2:end-1);
y1_experimental=y1(2:end-1);
%Calculo de los gamma con los valores experimentales
[Gamma1_experimental,Gamma2_experimental]=Coef_Act(Presiones,Presiones_Saturacion,x1_experimental,y1_experimental);

%Calculo de los logaritmos de gamma.
lnG1=log(Gamma1_experimental);
lnG2=log(Gamma2_experimental);

%Calculo de las areas de los logaritmos.
AreaG1=abs(AreaTrapecios(lnG1,x1));
AreaG2=abs(AreaTrapecios(lnG2,x1));

%Estimacion del error.
Error_Absoluto=abs((AreaG1-AreaG2))/(AreaG1+AreaG2);

%Define a partir del error si los datos son o no consistentes termodinamicamente con una tolerancia de 0.02.

if Error_Absoluto<0.02
    
    fprintf("Datos consistentes\n")
    
else
    
    fprintf("Datos inconsistentes\n")
    
end


fprintf("Error absoluto = ")

disp(Error_Absoluto)

%Grafica los logaritmos de gamma.
figure;

hold on;

plot(x1_experimental,lnG1);

plot(x1_experimental,lnG2);

%Limpia las variables que no voy a necesitar.
clear Error_Absoluto AreaG1 AreaG2 lnG1 lnG2
