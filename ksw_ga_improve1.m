function I2 = ksw_ga_improve1(I)
%I=imread('images/0146.jpg');
hist=imhist(I);%��ʾͼ��������״ͼ
total=0;
for i=0:255
    total=total+hist(i+1);
end
hist1=hist/total;%��ÿ��Ĺ�һ��//������Ϊi�ĸ���Pi
HT=0;%�洢ͼ����
for i=0:255
    if hist1(i+1)==0
        temp=0;
    else
        temp=hist1(i+1)*log(1/hist1(i+1));
    end
    HT=HT+temp;
end
    %��Ⱥ�����ʼ������Ⱥ��ȡ10��Ⱦɫ������Ʊ���ȡ8λ
    t0=clock;
    population=20;  
    X0=round(rand(1,population)*255);  %��ֵ  
    for i=1:population
        adapt_value0(i)=ksw(X0(i),0,255,hist1,HT);%��ֵ
    end    
    adapt_average0=mean(adapt_value0);    
    X1=X0;
    adapt_value1=adapt_value0;
    adapt_average1=adapt_average0;    
    %ѭ����������������ȡ200    
    generation=200;    
    for k=1:generation       
        s1=select_ga_improve(X1,adapt_value1,population);    
        s_code1=dec2bin(s1,8);    %����ֵ����ת��Ϊ��λ�Ķ�����
        c1=cross_ga_improve(s_code1,k,population);   
        v1=mutation_ga_improve(c1,k,population);   
        X2=(bin2dec(v1))';   
        for i=1:population
            adapt_value2(i)=ksw(X2(i),0,255,hist1,HT);
        end   
        adapt_average2=mean(adapt_value2);    
        if abs(adapt_average2-adapt_average1)<=0.01
            break;
        else
            X1=X2;
            adapt_value1=adapt_value2;
            adapt_average1=adapt_average2; 
        end
    end    
    max_value=max(adapt_value2);
    number=find(adapt_value2==max_value);
    t_opt=round(mean(X2(number)));
t1=clock;
search_time=etime(t1,t0);
%%��ֵ�ָ��ʾ����
threshold_opt=t_opt/255;
% threshold_opt
I1=1-im2bw(I,threshold_opt);
%imshow(I1);
I2 = bwareaopen(I1, 10, 8);