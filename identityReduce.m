function identityReduce(key, intermValueIter, outKVStore)
    while hasnext(intermValueIter)
        add(outKVStore, key, getnext(intermValueIter));
    end
end
