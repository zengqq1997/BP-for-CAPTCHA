function [rightdata,rate]=testbp()
load bp.mat
	% bp 测试
    chuan1=msgbox('正在创建测试数据...');
	image_dir=dir('images/*.jpg');
	for i = 1: length(image_dir)
	str_name = image_dir(i).name;
    for k=1:length(str_name)
            if(str_name(k)=='.')
                break
            end    
    end
	imgs_test{i} = str_name(1:k-1);
    
    end
    close (chuan1)
	rightnum = 0;
	sumnum = 0;
    max_size=[40,40];
    chuan2=msgbox('测试网络中...');
	for i = 1 : length(imgs_test)
		img_name = imgs_test{i};
		imgs = cutting(imread(['images/',img_name,'.jpg']), false);
		if (length(imgs) == length(img_name))
			for j = 1 : length(img_name)
				tmp_num = str2num(img_name(j)) + 1;

				%% 等大小化
				temp = zeros(max_size);
				imgs_size = size(imgs{j});
				temp(1:imgs_size(1,1), 1:imgs_size(1,2)) = imgs{j};
				imgs{j} = temp;

				input_size = numel(temp);
				testInput(j, :) = reshape(temp', input_size, 1);
            end
            
			size(testInput);
            
            
			Y = sim( net , testInput' );
		
			mans = [1:4];
			for j = 1 : length(img_name)
				ymax = 0;
				yans = NaN;
				for k = 1 : 10
					if (ymax < Y(k, j))
						ymax = Y(k, j);
						yans = k;
					end
				end
				mans(j) = yans-1;

				sumnum = sumnum + 1;
				if (mans(j) == str2num(img_name(j)))
					rightnum = rightnum + 1;
				end
			end

			img_name;
			mans;

        end
    end
    close (chuan2);
	rightdata = [rightnum, sumnum-rightnum];
    rate=rightdata/sumnum
	pie(rightdata, {'right', 'wrong'});