function test1(i,a)

i=imread('images/0146.jpg');
imshow(i);

%imshow(i)
I2=ksw_ga_improve1(i);
%imshow(img1)
	%imgGray = rgb2gray(i); % 转为灰度图像
%imshow(imgGray)
	%thresh = graythresh(imgGray); % 自动确定二值化阀值
	%BW = 1 - im2bw(imgGray,0.9);
    % 反转
%BW = 1 - img1;
%imshow(BW);
%I2 = bwareaopen(BW, 8, 8);

imshow(I2);
imgsize = size(I2);
varray=sum(I2);

va = mean(varray)  ; % 计算平均值
harray = sum(I2') ;
vb = mean(harray);
isanum = false; 
sumy = 0;
for i = 1 : imgsize(1, 1)
	if harray(i) > vb;
		if isanum == false;
			isanum = true;
			cvb = i;
			end
		else
			if isanum
				isanum = false;
				cve = i;
				sumy = sumy + 1;
				
					hold on;
					plot([0 imgsize(1,2)], [cvb cvb],'r--');
					plot([0 imgsize(1,2)], [cve cve], 'r--');
				
			end
		end
end
    
    	y = {};
	sumy = 0;

	for i = 1 : imgsize(1, 2);
		if varray(i) > va;
			if isanum == false;
				isanum = true;
				ctb = i;
			end
		else
			if isanum;
				isanum = false;
				cte = i;
				sumy = sumy + 1;
				
		hold on;
					plot([ctb ctb], [0 imgsize(1,1)],'r--');
					plot([cte cte], [0 imgsize(1,1)],'r--');
				t = I2(cvb:cve, ctb:cte);
               %imshow(t);
			   y{sumy} = t;
               
			end
		end
    end
    for i=1:sumy
           imshow(y{i});
           pause(3);
    end
