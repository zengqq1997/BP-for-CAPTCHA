%% ����ʹ��bp�����磬������ͼƬ���м����ؽڵ�15��������ڵ�10��
%% ����BP����ʶ����֤��, ����Ӧѧϰ��bp�㷨
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
    chuan=msgbox('����ѵ������...');
	y = train( net, input , output ) ;
    close (chuan)
end