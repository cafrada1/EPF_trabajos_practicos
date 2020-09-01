P_entrada=0.1013;
P_salida=0.6;
R=8.3145;
y1=0.5;
kb=1.381*10^-23;
Potencial="Lennard Jones";
Compuesto1="Nitrogeno";
Compuesto2="Nitrogeno";
for i=1:20    
    Temperatura_entrada=300+i*10;
    Temperatura_entrada_grafico(i)=300+i*10;
    
    if y1==0
        Compuesto1=Compuesto2;
    elseif y1==1
        Compuesto2=Compuesto1;
    end
    load(Compuesto1+'.mat');
    Inicio=[5*10^-21,2*10^-8];
    func=@(Parametros)Ajuste_Virial(Parametros,B_Experimental,T,kb,Potencial,Compuesto1);
    [Parametros_Virial_1,error1]=Minimizacion(func,Inicio);

    clear B_experimental T

    
    load(Compuesto2+'.mat');
    Inicio=[5*10^-21,2*10^-8];
    func=@(Parametros)Ajuste_Virial(Parametros,B_Experimental,T,kb,Potencial,Compuesto2);
    [Parametros_Virial_2,error2]=Minimizacion(func,Inicio);

    clear B_experimental T

    epsilon=(Parametros_Virial_1(1)*Parametros_Virial_2(1))^0.5;
    sigma=(Parametros_Virial_1(2)+Parametros_Virial_2(2))/2;
    Parametros_Virial_12=[epsilon,sigma];

    B_1=Lennard_Jones(Parametros_Virial_1,Temperatura_entrada,kb,Compuesto1);
    B_2=Lennard_Jones(Parametros_Virial_2,Temperatura_entrada,kb,Compuesto2);
    B_12=Lennard_Jones(Parametros_Virial_12,Temperatura_entrada,kb,"");
    B_e=(B_1*y1^2+B_2*(1-y1)^2+2*B_12*y1*(1-y1));

    B_T_e=Derivada_B_mezcla(Parametros_Virial_1,Parametros_Virial_2,Parametros_Virial_12,Temperatura_entrada,kb,y1,Compuesto1,Compuesto2);

    Entropia_Ideal_mezcla_entrada=Entropia_Ideal(Compuesto1,Temperatura_entrada,R,P_entrada)*y1+...
        Entropia_Ideal(Compuesto2,Temperatura_entrada,R,P_entrada)*(1-y1)-y1*R*log(y1)-(1-y1)*R*log(1-y1);

    Entropia_entrada=Entropia_Ideal_mezcla_entrada+Entropia_Residual(P_entrada,B_T_e);

    Entalpia_Ideal_mezcla_entrada=Entalpia_Ideal(Compuesto1,Temperatura_entrada,R)*y1+...
        Entalpia_Ideal(Compuesto2,Temperatura_entrada,R)*(1-y1);
    Entalpia_entrada=Entalpia_Ideal_mezcla_entrada+Entalpia_Residual(P_entrada,Temperatura_entrada,B_e,B_T_e);

    funcion_entropia=@(T)Ajuste_T(T,Compuesto1,Compuesto2,...
        Parametros_Virial_1,Parametros_Virial_2,Parametros_Virial_12,...
        P_salida,R,kb,y1,Entropia_entrada);

    [Temperatura_salida,error]=Minimizacion(funcion_entropia,1.25*Temperatura_entrada);

    B_1=Lennard_Jones(Parametros_Virial_1,Temperatura_salida,kb,Compuesto1);
    B_2=Lennard_Jones(Parametros_Virial_2,Temperatura_salida,kb,Compuesto2);
    B_12=Lennard_Jones(Parametros_Virial_12,Temperatura_salida,kb,"");
    B_s=(B_1*y1^2+B_2*(1-y1)^2+2*B_12*y1*(1-y1));

    B_T_s=Derivada_B_mezcla(Parametros_Virial_1,Parametros_Virial_2,Parametros_Virial_12,Temperatura_salida,kb,y1,Compuesto1,Compuesto2);

    Entalpia_Ideal_mezcla_salida=Entalpia_Ideal(Compuesto1,Temperatura_salida,R)*y1+...
        Entalpia_Ideal(Compuesto2,Temperatura_salida,R)*(1-y1);
    Entalpia_salida=Entalpia_Ideal_mezcla_salida+Entalpia_Residual(P_entrada,Temperatura_salida,B_s,B_T_s);

    Potencia_compresor=Entalpia_salida-Entalpia_entrada;
    Potencia_compresor_grafico(i)=Potencia_compresor*0.27778;
end
figure
hold on
plot(Temperatura_entrada_grafico,Potencia_compresor_grafico,'red')
scatter(Temperatura_entrada_grafico,Potencia_compresor_grafico,'filled','red')
title("Potencia vs Temperatura entrada")
xlabel("T (K)")
ylabel("Potencia (kW/kmol)")
legend('Potencia calculada','Location','northwest')