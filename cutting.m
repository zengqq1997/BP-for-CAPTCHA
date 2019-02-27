% ͼƬ�ָ���

function y = cutting(img, isshow)
	if nargin < 2; isshow = false; end
	if isshow;
		imshow(img); % ��ʾ��ɫͼ��
    end
    %img1=GA(img);
    I2=ksw_ga_improve1(img);
% 	imgGray = rgb2gray(img); % תΪ�Ҷ�ͼ��
% 
% 	%thresh = graythresh(imgGray); % �Զ�ȷ����ֵ����ֵ
% 	BW = 1 - im2bw(imgGray,0.9); % ��ת
% 	I2 = bwareaopen(BW, 8, 8);	 % ȥ����ͨ������С��10����ɢ��
    
	varray = sum(I2); 
	imgsize = size(I2);

	if isshow
		figure; % ��һ���µĴ�����ʾ�Ҷ�ͼ��
		imshow(imgGray); % ��ʾת����ĻҶ�ͼ��

		harray = sum(I2');
		x1 = 1 : imgsize(1, 1);
		x2 = 1 : imgsize(1, 2);
		figure; % ��һ���µĴ�����ʾ�ָ�ͼ
		plot(x1, harray, 'r+-', x2, varray, 'y*-');

		figure; % ��һ���µĴ�����ʾ�Ҷ�ͼ��
		imshow(I2); % ��ʾת����ĻҶ�ͼ��
	end

	va = mean(varray);    % ����ƽ��ֵ
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