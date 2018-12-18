#!/usr/bin/env bash
CLASS=CacheDataframeRunner
PACKAGE=cmsc.basic.df
JAR=target/cache-dataframe-1.0.0-SNAPSHOT-shaded.jar

CURR_DATE=$(date -u +"%Y-%m-%dT%H:%M:%S.%sZ")
APP_NAME=${CLASS}-$CURR_DATE
THREAD_COUNT=4
EXECUTOR_MEM=2048m
OVERHEAD_MEM=768m
echo ${APP_NAME},${THREAD_COUNT},${EXECUTOR_MEM},${OVERHEAD_MEM}
spark-submit --class ${PACKAGE}.${CLASS} --master local[${THREAD_COUNT}] --driver-memory 512m --executor-memory ${EXECUTOR_MEM} --conf spark.driver.memoryOverhead=384m --conf spark.executor.memoryOverhead=${OVERHEAD_MEM} --conf spark.app.name=${APP_NAME} ${JAR} ../data/test-gsod/