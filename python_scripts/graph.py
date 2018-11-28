#!/usr/bin/env python
# coding: utf-8

# In[8]:


import sys
# In[9]:


import re

INT_TABLE = {"one": 1, "two": 2, "three": 3, "four": 4, "five": 5}


# converts words "one" through "five" to an int
def word_to_int(word):
    return INT_TABLE[word.lower()]


def parse_spark_output_file(header_name, name):
    delimiter = "Local Basic"
    thread_pattern = "([a-zA-Z]{3,5})\sthread"
    data_file_pattern = "-2018.*Z"
    out_fp = open(name)
    text = out_fp.read().strip().split(delimiter)
    data_dict = {}
    for line in text:
        data_file_name_group = re.search(data_file_pattern, line)
        thread_group = re.search(thread_pattern, line)
        if thread_group and data_file_name_group:
            thread_count = word_to_int(thread_group.group().split()[0])
            data_file_name = data_file_name_group.group()
            key = f"{header_name}{data_file_name}".replace(":", "_")
            data_dict[key] = thread_count
    return data_dict


# In[19]:


import matplotlib.pyplot as plt
import json
import os

DATA_DIRECTORY = r"C:\\Users\maria\Documents\Grad School\Fall2018\CMSC611\Projects\spark-stats-dataframe-20181127T232049Z-001\spark-stats-dataframe"
SPARK_OUTPUT_FILE = r"C:\\Users\maria\Documents\Grad School\Fall2018\CMSC611\Projects\spark-stats-dataframe-task_metrics_run_output"
FILE_NAME = "BasicDataframeRunner"
files = os.listdir(DATA_DIRECTORY)

thread_counts = parse_spark_output_file(FILE_NAME, SPARK_OUTPUT_FILE)
print(thread_counts)
thread_nums = []
max_peaks = []
for a_file in files:
    pathed = os.path.join(DATA_DIRECTORY, a_file)
    fp = open(pathed)
    data_obj = json.load(fp)
    peak_exec_mems = []
    for job in data_obj:
        # Get peak memory values from metric data and thread count of given job
        peak_exec_mems.append(int(job["peakExecutionMemory"]))
    thread_nums.append(thread_counts[a_file])
    max_peaks.append(max(peak_exec_mems))
    peak_exec_mems = []

ax = plt.plot(thread_nums, max_peaks)
plt.axis([0, 6, 0, 10000000])
plt.xlabel("Thread Count")
plt.ylabel("Peak Memory (Power of 7)")
plt.show()

# In[ ]: