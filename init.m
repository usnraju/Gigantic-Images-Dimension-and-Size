setenv('HADOOP_HOME', '/home/nitw_viper_user/hadoop-2.7.2');
cluster = parallel.cluster.Hadoop;
cluster.HadoopProperties('mapred.job.tracker') = 'master:9008';
cluster.HadoopProperties('fs.default.name') = 'hdfs://master:9000';
disp(cluster);

mapreducer(cluster);
% 
seqFolder = 'hdfs://master:9000/memimg/';

demoFolder1 = fullfile(seqFolder, '100images');
ds=datastore(demoFolder1,'Type', 'image','FileExtensions', {'.jpg','.png'});

seq_folder='hdfs://master:9000/test/rect_seq_memimg_1';
%seqds = mapreduce(ds, @identityMap, @identityReduce,'OutputFolder',seq_folder);
seqds = datastore('hdfs://master:9000/test/rect_seq_memimg_1/*.seq');

rect_output='hdfs://master:9000/test/rect_output_memimg_5';
rect_cnt = mapreduce(seqds, @rect_cnt_map, @rect_cnt_reduce,'OutputFolder',rect_output);
t=readall(rect_cnt);
size(t);
disp(t);