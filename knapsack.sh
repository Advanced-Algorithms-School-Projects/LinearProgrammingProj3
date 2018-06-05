#!/bin/bash

datanames='knapsack8 knapsack12 knapsack16 knapsack20 knapsack28 knapsack32 knapsack48 knapsack64 knapsack128 knapsack256 knapsack512 knapsack1024'
datanamesarray=($datanames)
for item in ${datanamesarray[@]}; do
  ( ampl ;
model knapsack.mod ; 
data knapsack-dat/${item}.dat ; 
solve;
display objective >${item}.output;
display x > ${item}.output;
)
done
echo waiting..
wait
echo done
