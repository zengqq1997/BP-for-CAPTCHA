function [imgs_sample,imgs_sample_num]=classification()
train_dir=dir('train/*.jpg');
for i = 1: length(train_dir)
	str_name = train_dir(i).name;
    for k=1:length(str_name)
            if(str_name(k)=='.')
                break
            end    
     end
	imgs_name{i} = str_name(1:k-1);
    
end
len=length(train_dir);
imgs_sample = cell(100);
imgs_sample_num = zeros(1,len);
max_size = [0 0];


%% 将数字分类放置
for i = 1 : length(imgs_name)
	img_name = imgs_name{i};
	imgs = cutting(imread(['train/',img_name,'.jpg']), false);
	if (length(imgs) == length(img_name))
		imgs_num_size = length(img_name);
		for j = 1 : imgs_num_size
			tmp_num = str2num(img_name(j)) + 1;
			imgs_sample_num(tmp_num) = imgs_sample_num(tmp_num) + 1;
			imgs_sample{tmp_num, imgs_sample_num(tmp_num)} = imgs{j};
			tmp_size = size(imgs{j});
			if max_size(1,1) < tmp_size(1,1); max_size(1,1) = tmp_size(1,1); end
			if max_size(1,2) < tmp_size(1,2); max_size(1,2) = tmp_size(1,2); end
		end
	end
end

max_size = [40 40];

%% 归一化所有样本，使其等大小
for i = 1 : 10
    for j = 1 : imgs_sample_num(i)
		temp = zeros(max_size);
		imgs_size = size(imgs_sample{i, j});
        
		temp(1:imgs_size(1,1), 1:imgs_size(1,2)) = imgs_sample{i, j};
		imgs_sample{i, j} = temp;
		%figure;
		%imshow(temp);z
   end
end