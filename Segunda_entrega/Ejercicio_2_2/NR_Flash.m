function [Datos] = NR_Flash(R,T,P,Tc,Pc,w,k,z)

x=z;
y=z;
Fracc_vapor=0.4;

Error_fracc=10;
Error_x=ones(1,length(z));
Error_y=ones(1,length(z));

format long
contador=0;
while(max([Error_fracc,max(Error_x),max(Error_y)]))>1e-10 && contador<2000
    f_fracc=0;
    f_prima_fracc=0;
    for i=1:length(z)
        
        Gamma_liquido(i)=coeficiente_fugacidad_mix(R,T,Tc,P,Pc,w,k,x,0,i);
        
        Gamma_vapor(i)=coeficiente_fugacidad_mix(R,T,Tc,P,Pc,w,k,y,1,i);
    
        K(i)=Gamma_liquido(i)/Gamma_vapor(i);
    
        f_fracc=f_fracc+((K(i)-1)*z(i))/(1+(K(i)-1)*Fracc_vapor);
    
        f_prima_fracc= f_prima_fracc+((K(i)-1)^2*(z(i)))/(1+(K(i)-1)*Fracc_vapor)^2;
        
        contador=contador+1;
        
    end
    Fracc_vapor=Fracc_vapor+f_fracc/f_prima_fracc;  
    disp(Fracc_vapor)
    for i=1:length(z)
        Error_x(i)=abs(x(1,i)-z(i)/(1+(K(i)-1)*Fracc_vapor));
        Error_y(i)=abs(y(1,i)-K(i)*z(i)/(1+(K(i)-1)*Fracc_vapor));
        
        x(1,i)=z(i)/(1+(K(i)-1)*Fracc_vapor);
   
        y(1,i)=K(i)*z(i)/(1+(K(i)-1)*Fracc_vapor);

    end
    Error_fracc=abs(f_fracc/f_prima_fracc);    

    if Fracc_vapor>1 && contador>15
        Fracc_vapor=1;
        y=z;
        x=zeros(1,length(z));
        break
    elseif Fracc_vapor<0 && contador>15
        Fracc_vapor=0;
        x=z;
        y=zeros(1,length(z));
        break
    end
end

Datos=[Fracc_vapor,x,y];
end

