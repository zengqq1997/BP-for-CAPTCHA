function c1=cross_ga_improve(s_code1,k,population)
   
   %交叉算子
   
   if k <= 20                                 %交叉概率取0.8,0.6
       pc=0.8; 
   else
       pc=0.6; 
   end
   

   
   
   %(1,2)/(3,4)/(5,6)进行交叉运算，(7,8)/(9,10)复制
   
   ww=s_code1;
   
   for i=1:(pc*population/2)
       r=abs(round(rand(1)*20)-3);
       for j=(r+1):8
           temp=ww(2*i-1,j);
           ww(2*i-1,j)=ww(2*i,j);
           ww(2*i,j)=temp;
       end
   end
   
   c1=ww;
   
           
           
       
       
   
   
   
   