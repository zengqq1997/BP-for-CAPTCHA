% �������ݼ�
%% buildtrainset: ���������������ʺϵ�ѵ����
function [inputs outputs] = buildtrainset(imgs, number)
	i = 1;
	for k = 1 : 10
		for j = 1 : number(k)
			input = imgs{k, j};
			input_size = numel(input);
            

			%% �Ҳ�֪������reshape�����Ĵ���
            
			inputs(i,:) = reshape(input',input_size,1 );
			outputs(i, :) = zeros(10, 1);
			outputs(i, k) = 1;
			i = i + 1;
		end
    end
   save inputs.mat inputs;
   save outputs.mat outputs;
end