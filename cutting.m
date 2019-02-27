% 图片分割器

function y = cutting(img, isshow)
	if nargin < 2; isshow = false; end
	if isshow;
		imshow(img); % 显示彩色图像
    end
    %img1=GA(img);
    I2=ksw_ga_improve1(img);
% 	imgGray = rgb2gray(img); % 转为灰度图像
% 
% 	%thresh = graythresh(imgGray); % 自动确定二值化阀值
% 	BW = 1 - im2bw(imgGray,0.9); % 反转
% 	I2 = bwareaopen(BW, 8, 8);	 % 去除连通分量中小于10的离散点
    
	varray = sum(I2); 
	imgsize = size(I2);

	if isshow
		figure; % 打开一个新的窗口显示灰度图像
		imshow(imgGray); % 显示转化后的灰度图像

		harray = sum(I2');
		x1 = 1 : imgsize(1, 1);
		x2 = 1 : imgsize(1, 2);
		figure; % 打开一个新的窗口显示分割图
		plot(x1, harray, 'r+-', x2, varray, 'y*-');

		figure; % 打开一个新的窗口显示灰度图像
		imshow(I2); % 显示转化后的灰度图像
	end

	va = mean(varray);    % 计算平均值
	harray = sum(I2'); 
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
				if isshow;
					hold on;
					plot([0 imgsize(1,2)], [cvb cvb],'r--');
					plot([0 imgsize(1,2)], [cve cve], 'r--');
				end
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
				if isshow;
					hold on;
					plot([ctb ctb], [0 imgsize(1,1)],'r--');
					plot([cte cte], [0 imgsize(1,1)],'r--');
				end
				t = I2(cvb:cve, ctb:cte);
				y{sumy} = t;
              
			end
		end
	end
end