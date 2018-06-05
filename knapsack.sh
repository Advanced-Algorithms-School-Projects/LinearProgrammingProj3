#!/bin/bash

datanames='knapsack8.dat knapsack12.dat knapsack16.dat knapsack20.dat knapsack28.dat knapsack32.dat knapsack48.dat knapsack64.dat knapsack128.dat knapsack256.dat knapsack512.dat knapsack1024.dat'
datanamesarray=($datanames)
for item in ${datanamesarray[@]}; do
  ( ./ampl ${item}.run)
done
echo waiting..
wait
echo done
