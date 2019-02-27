function mans=testcode(str,imgname)
load bp.mat
	% bp 测试
% 	image_dir=dir('images/*.jpg');
% 	for i = 1: length(image_dir)
% 	str_name = image_dir(i).name;
    for k=1:length(imgname)
            if(imgname(k)=='.')
                break
            end    
    end
	img_test= imgname(1:k-1);
    
%     
% end

% 	rightnum = 0;
% 	sumnum = 0;

    max_size=[40,40];
% 		img_name = imgs_test{i};
		imgs = cutting(imread(str), false);
		if (length(imgs) == length(img_test))
			for j = 1 : length(img_test)
				tmp_num = str2num(img_test(j)) + 1;
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
			for j = 1 : length(img_test)
				ymax = 0;
				yans = NaN;
				for k = 1 : 10
					if (ymax < Y(k, j))
						ymax = Y(k, j);
						yans = k;
					end
				end
				mans(j) = yans-1;

				
			end

			img_test;
			mans;
        else
            mans=img_test;
		end

