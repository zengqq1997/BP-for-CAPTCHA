%% 首先使用bp神经网络，输入是图片，中间隐藏节点15个，输出节点10个
%% 利用BP网络识别验证码, 自适应学习率bp算法
function y = bpann(input, output,show,epochs,goal,learnRate)
	net = newff( minmax(input) , [20 10] , { 'logsig' 'purelin' } , 'traingdx' ); 
	net.trainparam.show = show ;
	net.trainparam.epochs = epochs ;
	net.trainparam.goal = goal ;
	net.trainParam.lr = learnRate ;
%     net.trainParam.showWindow = false; 
%     net.trainParam.showCommandLine = false; 
	size(input);
	size(output);
    chuan=msgbox('正在训练网络...');
	y = train( net, input , output ) ;
    close (chuan)
end