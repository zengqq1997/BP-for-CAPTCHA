

% img0928 = imread('train/0928.jpg');
% 
% %% 图片预处理，切割操作
% 
% imgs = cutting(img0928, true);
% imgs_size = length(imgs)
% for i = 1 : imgs_size
% 	figure;
% 	imshow(imgs{i});
% end

function main(show,epochs,goal,learnRate)
load inputs.mat
load outputs.mat
% [inputs,outputs]=classification();



% 学习对比各神经网络的学习效果

%bp网络
trainbp(inputs,outputs,show,epochs,goal,learnRate);
qq=100