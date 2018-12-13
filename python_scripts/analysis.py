#!/usr/bin/env python
import re
import matplotlib.pyplot as plt
import json
import os
cwd = os.getcwd()
base_dir = os.path.dirname(cwd)

metric_output_mapping = {
    "basic-dataframe-run-output": "BasicDataframe",
    "basic-dataset-run-output": "BasicDataset",
    "basic-rdd-run-output": "BasicRDD",
    "cache-dataframe-run-output": "CacheDataframe",
    "cache-dataset-run-output": "CacheDataset",
    "cache-rdd-run-output": "CacheRDD",
    "kmeans-dataframe-run-output": "KMeansDataframe",
    "kmeans-dataset-run-output": "KMeansDataset",
    "map-partitions-rdd-run-output": "MapPartitionsRDD",
    "map-rdd-run-output": "MapRDD",
    "partition-dataframe-run-output": "PartitionDataframe",
    "parititon-dataset-run-output": "PartitionDataset",
    "partition-rdd-run-output": "PartitionRDD"
}

def get_associated_files(run_output_name):
    files = os.listdir(base_dir + "/spark-stats")
    return [a_file for a_file in files if a_file.startswith(metric_output_mapping[run_output_name])]

print(cwd)
print(base_dir)
print(get_associated_files("basic-dataframe-run-output"))