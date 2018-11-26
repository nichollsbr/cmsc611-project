#!/usr/bin/env bash
#cd basic-dataframe
#./run.sh > task_metrics_run_output
#cd ..

cd basic-dataset
./run.sh > task_metrics_run_output
cd ..

cd basic-rdd
./run.sh > task_metrics_run_output
