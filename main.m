

% img0928 = imread('train/0928.jpg');
% 
% %% ͼƬԤ�����и����
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



% ѧϰ�Աȸ��������ѧϰЧ��

%bp����
trainbp(inputs,outputs,show,epochs,goal,learnRate);
qq=100