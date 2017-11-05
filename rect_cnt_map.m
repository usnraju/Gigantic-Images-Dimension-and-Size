function rect_cnt_map(data, ~, intermKVStore)

% Extract the image
im = data.Value{1};

% Call the rectangle counting algorithm
rectCount = rect_counter(im);

% The original file name is available as the key
fileName = data.Key{1};
%[~, name] = fileparts(fileName);

% Note: focus blur is the key
add(intermKVStore, fileName, rectCount); 

add(intermKVStore, 'TotalCount', rectCount);
end

