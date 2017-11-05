function rectCount =rect_counter(im)
    tic
    bw = im2bw(im);
	 % find both black and white regions
	stats = [regionprops(bw); regionprops(not(bw))];
    rectCount=numel(stats)-1;
    toc