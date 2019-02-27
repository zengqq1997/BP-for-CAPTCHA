function y = trainbp(a, b,show,epochs,goal,learnRate)
	% bp ÍøÂçÑµÁ·
% 	[a, b] = buildtrainset(imgs_sample, imgs_sample_num);
    
	net = bpann(a', b',show,epochs,goal,learnRate);
    
    save bp.mat net
    

end