setenv('HADOOP_HOME', '/home/nitw_viper_user/hadoop-2.7.2');
cluster = parallel.cluster.Hadoop;
cluster.HadoopProperties('mapred.job.tracker') = 'master:9008';
cluster.HadoopProperties('fs.default.name') = 'hdfs://master:9000';
disp(cluster);

mapreducer(cluster);

seqFolder = 'hdfs://master:9000/image_13L/';
cnt=580;
for i=30:40
    
    demoFolder1 = fullfile(seqFolder,num2str(cnt));
    demoFolder2 = fullfile(seqFolder,num2str(cnt+1));
    demoFolder3 = fullfile(seqFolder,num2str(cnt+2));
    demoFolder4 = fullfile(seqFolder,num2str(cnt+3));
    demoFolder5 = fullfile(seqFolder,num2str(cnt+4));
    demoFolder6 = fullfile(seqFolder,num2str(cnt+5));
    demoFolder7 = fullfile(seqFolder,num2str(cnt+6));
    demoFolder8 = fullfile(seqFolder,num2str(cnt+7));
    demoFolder9 = fullfile(seqFolder,num2str(cnt+8));
    demoFolder10 = fullfile(seqFolder,num2str(cnt+9));

    demoFolder11 = fullfile(seqFolder,num2str(cnt+10));
    demoFolder12 = fullfile(seqFolder,num2str(cnt+11));
    demoFolder13 = fullfile(seqFolder,num2str(cnt+12));
    demoFolder14 = fullfile(seqFolder,num2str(cnt+13));
    demoFolder15 = fullfile(seqFolder,num2str(cnt+14));
    demoFolder16 = fullfile(seqFolder,num2str(cnt+15));
    demoFolder17 = fullfile(seqFolder,num2str(cnt+16));
    demoFolder18 = fullfile(seqFolder,num2str(cnt+17));
    demoFolder19 = fullfile(seqFolder,num2str(cnt+18));
    demoFolder20 = fullfile(seqFolder,num2str(cnt+19));

    imageDS = imageDatastore({demoFolder1,demoFolder2,demoFolder3,demoFolder4,demoFolder5,demoFolder6,demoFolder7,demoFolder8,demoFolder9,demoFolder10, ...
                          demoFolder11,demoFolder12,demoFolder13,demoFolder14,demoFolder15,demoFolder16,demoFolder17,demoFolder18,demoFolder19,demoFolder20 ...
                          },'FileExtensions', {'.JPEG'});
% imageDS = imageDatastore({demoFolder1,demoFolder2},'FileExtensions', {'.jpg'});
%output_identity='hdfs://master:9000/corel_image_10L_seq_9';
    output_identity=strcat('hdfs://master:9000/image_13L_seq_',num2str(i));
    seqds = mapreduce(imageDS, @identityMap, @identityReduce,'OutputFolder',output_identity);
    disp(seqds);
    cnt=cnt+20;
    pause(600);
end
