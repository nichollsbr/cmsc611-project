#!/usr/bin/env bash
CLASS=CacheRDDRunner
PACKAGE=cmsc.basic.rdd
JAR=target/cache-rdd-1.0.0-SNAPSHOT-shaded.jar

echo "appName,threadCount,executorMem,overheadMem"

CURR_DATE=$(date -u +"%Y-%m-%dT%H:%M:%S.%sZ")
APP_NAME=${CLASS}-$CURR_DATE
THREAD_COUNT=1
EXECUTOR_MEM=512m
OVERHEAD_MEM=384m
echo ${APP_NAME},${THREAD_COUNT},${EXECUTOR_MEM},${OVERHEAD_MEM}
spark-submit --class ${PACKAGE}.${CLASS} --master local[${THREAD_COUNT}] --driver-memory 512m --executor-memory ${EXECUTOR_MEM} --conf spark.driver.memoryOverhead=384m --conf spark.executor.memoryOverhead=${OVERHEAD_MEM} --conf spark.app.name=${APP_NAME} --conf spark.extraListeners=ch.cern.sparkmeasure.FlightRecorderTaskMetrics --conf spark.executorEnv.taskMetricsFileName=../spark-stats/$APP_NAME --conf spark.executorEnv.taskMetricsFormat="json" ${JAR} ../data/test-gsod/

CURR_DATE=$(date -u +"%Y-%m-%dT%H:%M:%S.%sZ")
APP_NAME=${CLASS}-$CURR_DATE
THREAD_COUNT=1
EXECUTOR_MEM=1024m
OVERHEAD_MEM=384m
echo ${APP_NAME},${THREAD_COUNT},${EXECUTOR_MEM},${OVERHEAD_MEM}
spark-submit --class ${PACKAGE}.${CLASS} --master local[${THREAD_COUNT}] --driver-memory 512m --executor-memory ${EXECUTOR_MEM} --conf spark.driver.memoryOverhead=384m --conf spark.executor.memoryOverhead=${OVERHEAD_MEM} --conf spark.app.name=${APP_NAME} --conf spark.extraListeners=ch.cern.sparkmeasure.FlightRecorderTaskMetrics --conf spark.executorEnv.taskMetricsFileName=../spark-stats/$APP_NAME --conf spark.executorEnv.taskMetricsFormat="json" ${JAR} ../data/test-gsod/

CURR_DATE=$(date -u +"%Y-%m-%dT%H:%M:%S.%sZ")
APP_NAME=${CLASS}-$CURR_DATE
THREAD_COUNT=1
EXECUTOR_MEM=1024m
OVERHEAD_MEM=768m
echo ${APP_NAME},${THREAD_COUNT},${EXECUTOR_MEM},${OVERHEAD_MEM}
spark-submit --class ${PACKAGE}.${CLASS} --master local[${THREAD_COUNT}] --driver-memory 512m --executor-memory ${EXECUTOR_MEM} --conf spark.driver.memoryOverhead=384m --conf spark.executor.memoryOverhead=${OVERHEAD_MEM} --conf spark.app.name=${APP_NAME} --conf spark.extraListeners=ch.cern.sparkmeasure.FlightRecorderTaskMetrics --conf spark.executorEnv.taskMetricsFileName=../spark-stats/$APP_NAME --conf spark.executorEnv.taskMetricsFormat="json" ${JAR} ../data/test-gsod/

CURR_DATE=$(date -u +"%Y-%m-%dT%H:%M:%S.%sZ")
APP_NAME=${CLASS}-$CURR_DATE
THREAD_COUNT=1
EXECUTOR_MEM=2048m
OVERHEAD_MEM=768m
echo ${APP_NAME},${THREAD_COUNT},${EXECUTOR_MEM},${OVERHEAD_MEM}
spark-submit --class ${PACKAGE}.${CLASS} --master local[${THREAD_COUNT}] --driver-memory 512m --executor-memory ${EXECUTOR_MEM} --conf spark.driver.memoryOverhead=384m --conf spark.executor.memoryOverhead=${OVERHEAD_MEM} --conf spark.app.name=${APP_NAME} --conf spark.extraListeners=ch.cern.sparkmeasure.FlightRecorderTaskMetrics --conf spark.executorEnv.taskMetricsFileName=../spark-stats/$APP_NAME --conf spark.executorEnv.taskMetricsFormat="json" ${JAR} ../data/test-gsod/

#2 thread
CURR_DATE=$(date -u +"%Y-%m-%dT%H:%M:%S.%sZ")
APP_NAME=${CLASS}-$CURR_DATE
THREAD_COUNT=2
EXECUTOR_MEM=512m
OVERHEAD_MEM=384m
echo ${APP_NAME},${THREAD_COUNT},${EXECUTOR_MEM},${OVERHEAD_MEM}
spark-submit --class ${PACKAGE}.${CLASS} --master local[${THREAD_COUNT}] --driver-memory 512m --executor-memory ${EXECUTOR_MEM} --conf spark.driver.memoryOverhead=384m --conf spark.executor.memoryOverhead=${OVERHEAD_MEM} --conf spark.app.name=${APP_NAME} --conf spark.extraListeners=ch.cern.sparkmeasure.FlightRecorderTaskMetrics --conf spark.executorEnv.taskMetricsFileName=../spark-stats/$APP_NAME --conf spark.executorEnv.taskMetricsFormat="json" ${JAR} ../data/test-gsod/

CURR_DATE=$(date -u +"%Y-%m-%dT%H:%M:%S.%sZ")
APP_NAME=${CLASS}-$CURR_DATE
THREAD_COUNT=2
EXECUTOR_MEM=512m
OVERHEAD_MEM=384m
echo ${APP_NAME},${THREAD_COUNT},${EXECUTOR_MEM},${OVERHEAD_MEM}
spark-submit --class ${PACKAGE}.${CLASS} --master local[${THREAD_COUNT}] --driver-memory 512m --executor-memory ${EXECUTOR_MEM} --conf spark.driver.memoryOverhead=384m --conf spark.executor.memoryOverhead=${OVERHEAD_MEM} --conf spark.app.name=${APP_NAME} --conf spark.extraListeners=ch.cern.sparkmeasure.FlightRecorderTaskMetrics --conf spark.executorEnv.taskMetricsFileName=../spark-stats/$APP_NAME --conf spark.executorEnv.taskMetricsFormat="json" ${JAR} ../data/test-gsod/

CURR_DATE=$(date -u +"%Y-%m-%dT%H:%M:%S.%sZ")
APP_NAME=${CLASS}-$CURR_DATE
THREAD_COUNT=2
EXECUTOR_MEM=1024m
OVERHEAD_MEM=384m
echo ${APP_NAME},${THREAD_COUNT},${EXECUTOR_MEM},${OVERHEAD_MEM}
spark-submit --class ${PACKAGE}.${CLASS} --master local[${THREAD_COUNT}] --driver-memory 512m --executor-memory ${EXECUTOR_MEM} --conf spark.driver.memoryOverhead=384m --conf spark.executor.memoryOverhead=${OVERHEAD_MEM} --conf spark.app.name=${APP_NAME} --conf spark.extraListeners=ch.cern.sparkmeasure.FlightRecorderTaskMetrics --conf spark.executorEnv.taskMetricsFileName=../spark-stats/$APP_NAME --conf spark.executorEnv.taskMetricsFormat="json" ${JAR} ../data/test-gsod/

CURR_DATE=$(date -u +"%Y-%m-%dT%H:%M:%S.%sZ")
APP_NAME=${CLASS}-$CURR_DATE
THREAD_COUNT=2
EXECUTOR_MEM=1024m
OVERHEAD_MEM=768m
echo ${APP_NAME},${THREAD_COUNT},${EXECUTOR_MEM},${OVERHEAD_MEM}
spark-submit --class ${PACKAGE}.${CLASS} --master local[${THREAD_COUNT}] --driver-memory 512m --executor-memory ${EXECUTOR_MEM} --conf spark.driver.memoryOverhead=384m --conf spark.executor.memoryOverhead=${OVERHEAD_MEM} --conf spark.app.name=${APP_NAME} --conf spark.extraListeners=ch.cern.sparkmeasure.FlightRecorderTaskMetrics --conf spark.executorEnv.taskMetricsFileName=../spark-stats/$APP_NAME --conf spark.executorEnv.taskMetricsFormat="json" ${JAR} ../data/test-gsod/

CURR_DATE=$(date -u +"%Y-%m-%dT%H:%M:%S.%sZ")
APP_NAME=${CLASS}-$CURR_DATE
THREAD_COUNT=2
EXECUTOR_MEM=2048m
OVERHEAD_MEM=768m
echo ${APP_NAME},${THREAD_COUNT},${EXECUTOR_MEM},${OVERHEAD_MEM}
spark-submit --class ${PACKAGE}.${CLASS} --master local[${THREAD_COUNT}] --driver-memory 512m --executor-memory ${EXECUTOR_MEM} --conf spark.driver.memoryOverhead=384m --conf spark.executor.memoryOverhead=${OVERHEAD_MEM} --conf spark.app.name=${APP_NAME} --conf spark.extraListeners=ch.cern.sparkmeasure.FlightRecorderTaskMetrics --conf spark.executorEnv.taskMetricsFileName=../spark-stats/$APP_NAME --conf spark.executorEnv.taskMetricsFormat="json" ${JAR} ../data/test-gsod/

#3 thread
CURR_DATE=$(date -u +"%Y-%m-%dT%H:%M:%S.%sZ")
APP_NAME=${CLASS}-$CURR_DATE
THREAD_COUNT=3
EXECUTOR_MEM=512m
OVERHEAD_MEM=384m
echo ${APP_NAME},${THREAD_COUNT},${EXECUTOR_MEM},${OVERHEAD_MEM}
spark-submit --class ${PACKAGE}.${CLASS} --master local[${THREAD_COUNT}] --driver-memory 512m --executor-memory ${EXECUTOR_MEM} --conf spark.driver.memoryOverhead=384m --conf spark.executor.memoryOverhead=${OVERHEAD_MEM} --conf spark.app.name=${APP_NAME} --conf spark.extraListeners=ch.cern.sparkmeasure.FlightRecorderTaskMetrics --conf spark.executorEnv.taskMetricsFileName=../spark-stats/$APP_NAME --conf spark.executorEnv.taskMetricsFormat="json" ${JAR} ../data/test-gsod/

CURR_DATE=$(date -u +"%Y-%m-%dT%H:%M:%S.%sZ")
APP_NAME=${CLASS}-$CURR_DATE
THREAD_COUNT=3
EXECUTOR_MEM=512m
OVERHEAD_MEM=384m
echo ${APP_NAME},${THREAD_COUNT},${EXECUTOR_MEM},${OVERHEAD_MEM}
spark-submit --class ${PACKAGE}.${CLASS} --master local[${THREAD_COUNT}] --driver-memory 512m --executor-memory ${EXECUTOR_MEM} --conf spark.driver.memoryOverhead=384m --conf spark.executor.memoryOverhead=${OVERHEAD_MEM} --conf spark.app.name=${APP_NAME} --conf spark.extraListeners=ch.cern.sparkmeasure.FlightRecorderTaskMetrics --conf spark.executorEnv.taskMetricsFileName=../spark-stats/$APP_NAME --conf spark.executorEnv.taskMetricsFormat="json" ${JAR} ../data/test-gsod/

CURR_DATE=$(date -u +"%Y-%m-%dT%H:%M:%S.%sZ")
APP_NAME=${CLASS}-$CURR_DATE
THREAD_COUNT=3
EXECUTOR_MEM=1024m
OVERHEAD_MEM=384m
echo ${APP_NAME},${THREAD_COUNT},${EXECUTOR_MEM},${OVERHEAD_MEM}
spark-submit --class ${PACKAGE}.${CLASS} --master local[${THREAD_COUNT}] --driver-memory 512m --executor-memory ${EXECUTOR_MEM} --conf spark.driver.memoryOverhead=384m --conf spark.executor.memoryOverhead=${OVERHEAD_MEM} --conf spark.app.name=${APP_NAME} --conf spark.extraListeners=ch.cern.sparkmeasure.FlightRecorderTaskMetrics --conf spark.executorEnv.taskMetricsFileName=../spark-stats/$APP_NAME --conf spark.executorEnv.taskMetricsFormat="json" ${JAR} ../data/test-gsod/

CURR_DATE=$(date -u +"%Y-%m-%dT%H:%M:%S.%sZ")
APP_NAME=${CLASS}-$CURR_DATE
THREAD_COUNT=3
EXECUTOR_MEM=1024m
OVERHEAD_MEM=768m
echo ${APP_NAME},${THREAD_COUNT},${EXECUTOR_MEM},${OVERHEAD_MEM}
spark-submit --class ${PACKAGE}.${CLASS} --master local[${THREAD_COUNT}] --driver-memory 512m --executor-memory ${EXECUTOR_MEM} --conf spark.driver.memoryOverhead=384m --conf spark.executor.memoryOverhead=${OVERHEAD_MEM} --conf spark.app.name=${APP_NAME} --conf spark.extraListeners=ch.cern.sparkmeasure.FlightRecorderTaskMetrics --conf spark.executorEnv.taskMetricsFileName=../spark-stats/$APP_NAME --conf spark.executorEnv.taskMetricsFormat="json" ${JAR} ../data/test-gsod/

CURR_DATE=$(date -u +"%Y-%m-%dT%H:%M:%S.%sZ")
APP_NAME=${CLASS}-$CURR_DATE
THREAD_COUNT=3
EXECUTOR_MEM=2048m
OVERHEAD_MEM=768m
echo ${APP_NAME},${THREAD_COUNT},${EXECUTOR_MEM},${OVERHEAD_MEM}
spark-submit --class ${PACKAGE}.${CLASS} --master local[${THREAD_COUNT}] --driver-memory 512m --executor-memory ${EXECUTOR_MEM} --conf spark.driver.memoryOverhead=384m --conf spark.executor.memoryOverhead=${OVERHEAD_MEM} --conf spark.app.name=${APP_NAME} --conf spark.extraListeners=ch.cern.sparkmeasure.FlightRecorderTaskMetrics --conf spark.executorEnv.taskMetricsFileName=../spark-stats/$APP_NAME --conf spark.executorEnv.taskMetricsFormat="json" ${JAR} ../data/test-gsod/

#4 thread
CURR_DATE=$(date -u +"%Y-%m-%dT%H:%M:%S.%sZ")
APP_NAME=${CLASS}-$CURR_DATE
THREAD_COUNT=4
EXECUTOR_MEM=512m
OVERHEAD_MEM=384m
echo ${APP_NAME},${THREAD_COUNT},${EXECUTOR_MEM},${OVERHEAD_MEM}
spark-submit --class ${PACKAGE}.${CLASS} --master local[${THREAD_COUNT}] --driver-memory 512m --executor-memory ${EXECUTOR_MEM} --conf spark.driver.memoryOverhead=384m --conf spark.executor.memoryOverhead=${OVERHEAD_MEM} --conf spark.app.name=${APP_NAME} --conf spark.extraListeners=ch.cern.sparkmeasure.FlightRecorderTaskMetrics --conf spark.executorEnv.taskMetricsFileName=../spark-stats/$APP_NAME --conf spark.executorEnv.taskMetricsFormat="json" ${JAR} ../data/test-gsod/

CURR_DATE=$(date -u +"%Y-%m-%dT%H:%M:%S.%sZ")
APP_NAME=${CLASS}-$CURR_DATE
THREAD_COUNT=4
EXECUTOR_MEM=512m
OVERHEAD_MEM=384m
echo ${APP_NAME},${THREAD_COUNT},${EXECUTOR_MEM},${OVERHEAD_MEM}
spark-submit --class ${PACKAGE}.${CLASS} --master local[${THREAD_COUNT}] --driver-memory 512m --executor-memory ${EXECUTOR_MEM} --conf spark.driver.memoryOverhead=384m --conf spark.executor.memoryOverhead=${OVERHEAD_MEM} --conf spark.app.name=${APP_NAME} --conf spark.extraListeners=ch.cern.sparkmeasure.FlightRecorderTaskMetrics --conf spark.executorEnv.taskMetricsFileName=../spark-stats/$APP_NAME --conf spark.executorEnv.taskMetricsFormat="json" ${JAR} ../data/test-gsod/

CURR_DATE=$(date -u +"%Y-%m-%dT%H:%M:%S.%sZ")
APP_NAME=${CLASS}-$CURR_DATE
THREAD_COUNT=4
EXECUTOR_MEM=1024m
OVERHEAD_MEM=384m
echo ${APP_NAME},${THREAD_COUNT},${EXECUTOR_MEM},${OVERHEAD_MEM}
spark-submit --class ${PACKAGE}.${CLASS} --master local[${THREAD_COUNT}] --driver-memory 512m --executor-memory ${EXECUTOR_MEM} --conf spark.driver.memoryOverhead=384m --conf spark.executor.memoryOverhead=${OVERHEAD_MEM} --conf spark.app.name=${APP_NAME} --conf spark.extraListeners=ch.cern.sparkmeasure.FlightRecorderTaskMetrics --conf spark.executorEnv.taskMetricsFileName=../spark-stats/$APP_NAME --conf spark.executorEnv.taskMetricsFormat="json" ${JAR} ../data/test-gsod/

CURR_DATE=$(date -u +"%Y-%m-%dT%H:%M:%S.%sZ")
APP_NAME=${CLASS}-$CURR_DATE
THREAD_COUNT=4
EXECUTOR_MEM=1024m
OVERHEAD_MEM=768m
echo ${APP_NAME},${THREAD_COUNT},${EXECUTOR_MEM},${OVERHEAD_MEM}
spark-submit --class ${PACKAGE}.${CLASS} --master local[${THREAD_COUNT}] --driver-memory 512m --executor-memory ${EXECUTOR_MEM} --conf spark.driver.memoryOverhead=384m --conf spark.executor.memoryOverhead=${OVERHEAD_MEM} --conf spark.app.name=${APP_NAME} --conf spark.extraListeners=ch.cern.sparkmeasure.FlightRecorderTaskMetrics --conf spark.executorEnv.taskMetricsFileName=../spark-stats/$APP_NAME --conf spark.executorEnv.taskMetricsFormat="json" ${JAR} ../data/test-gsod/

CURR_DATE=$(date -u +"%Y-%m-%dT%H:%M:%S.%sZ")
APP_NAME=${CLASS}-$CURR_DATE
THREAD_COUNT=4
EXECUTOR_MEM=2048m
OVERHEAD_MEM=768m
echo ${APP_NAME},${THREAD_COUNT},${EXECUTOR_MEM},${OVERHEAD_MEM}
spark-submit --class ${PACKAGE}.${CLASS} --master local[${THREAD_COUNT}] --driver-memory 512m --executor-memory ${EXECUTOR_MEM} --conf spark.driver.memoryOverhead=384m --conf spark.executor.memoryOverhead=${OVERHEAD_MEM} --conf spark.app.name=${APP_NAME} --conf spark.extraListeners=ch.cern.sparkmeasure.FlightRecorderTaskMetrics --conf spark.executorEnv.taskMetricsFileName=../spark-stats/$APP_NAME --conf spark.executorEnv.taskMetricsFormat="json" ${JAR} ../data/test-gsod/
