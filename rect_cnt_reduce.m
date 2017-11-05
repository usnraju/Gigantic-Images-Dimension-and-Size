function rect_cnt_reduce(key, intermValueIter, outKVStore)
        count = 0;
 
if(strcmp('TotalCount',key))
         while(hasnext(intermValueIter))
             value = getnext(intermValueIter);
          count=count+value;
         end
      add(outKVStore, key, count);
    else
   
    while hasnext(intermValueIter)
        add(outKVStore, key, getnext(intermValueIter));
    end
end
