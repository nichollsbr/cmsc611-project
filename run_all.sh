#!/usr/bin/env bash
cd map-partitions-rdd
./run.sh > map-partitions-rdd-run-output
cd ..

cd map-rdd
./run.sh > map-rdd-run-output
cd ..

cd basic-dataframe
./run.sh > basic-dataframe-run-output
cd ..

cd basic-dataset
./run.sh > basic-dataset-run-output
cd ..

cd basic-rdd
./run.sh > basic-rdd-run-output
cd ..

cd partition-dataframe
./run.sh > basic-dataframe-run-output
cd ..

cd partition-dataset
./run.sh > basic-dataset-run-output
cd ..

cd partition-rdd
./run.sh > basic-rdd-run-output
cd ..
