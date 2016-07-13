../bin/hadoop dfs -rmr temp
../bin/hadoop dfs -rmr output*
../bin/hadoop dfs -rmr out
#syntax ../bin/hadoop jar dmtl.jar graphMining <input path> <output path> <support> <# of mapper> <#of reducer>
../bin/hadoop jar dmtl.jar graphMining /user/rabbi/input_new.txt /user/rabbi/out 1 1 1
