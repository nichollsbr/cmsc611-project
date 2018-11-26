#!/usr/bin/env bash
# We use the following commands before each run to ensure the app id is unique
#CURR_DATE=$(date -u +"%Y-%m-%dT%H:%M:%S.%sZ") && APP_NAME=BasicDatasetRunner-$CURR_DATE

#No metrics
#CURR_DATE=$(date -u +"%Y-%m-%dT%H:%M:%S.%sZ") && APP_NAME=BasicDatasetRunner-$CURR_DATE && spark-submit --class cmsc.basic.ds.BasicDatasetRunner --master local[2] --conf spark.app.name=$APP_NAME target/basic-dataset-1.0.0-SNAPSHOT-shaded.jar ../data/test-gsod/

#This is the Stage metrics, but I don't think we need these.
#Single File
#CURR_DATE=$(date -u +"%Y-%m-%dT%H:%M:%S.%sZ") && APP_NAME=BasicDatasetRunner-$CURR_DATE && spark-submit --class cmsc.basic.ds.BasicDatasetRunner --master local[1] --conf spark.app.name=$APP_NAME --conf spark.extraListeners=ch.cern.sparkmeasure.FlightRecorderTaskMetrics --conf spark.executorEnv.taskMetricsFileName=/tmp/spark-stats/$APP_NAME --conf spark.executorEnv.taskMetricsFormat="json" target/basic-dataset-1.0.0-SNAPSHOT-shaded.jar ../data/test-gsod/010010-99999-2018.op.csv.gz

#All test files
echo "-----Task Metrics-----"
echo "Local Basic Dataset. Lowest memory settings. One thread. Staging Metrics."
CURR_DATE=$(date -u +"%Y-%m-%dT%H:%M:%S.%sZ")
APP_NAME=BasicDatasetRunner-$CURR_DATE
echo $APP_NAME
spark-submit --class cmsc.basic.ds.BasicDatasetRunner --master local[1] --driver-memory 512m --executor-memory 512m --conf spark.driver.memoryOverhead=384m --conf spark.executor.memoryOverhead=384m --conf spark.app.name=$APP_NAME --conf spark.extraListeners=ch.cern.sparkmeasure.FlightRecorderTaskMetrics --conf spark.executorEnv.taskMetricsFileName=../spark-stats/$APP_NAME --conf spark.executorEnv.taskMetricsFormat="json" target/basic-dataset-1.0.0-SNAPSHOT-shaded.jar ../data/test-gsod/

echo "Local Basic Dataset. Mid executor memory settings. One thread. Staging Metrics."
CURR_DATE=$(date -u +"%Y-%m-%dT%H:%M:%S.%sZ")
APP_NAME=BasicDatasetRunner-$CURR_DATE
echo $APP_NAME
spark-submit --class cmsc.basic.ds.BasicDatasetRunner --master local[1] --driver-memory 512m --executor-memory 1024m --conf spark.driver.memoryOverhead=384m --conf spark.executor.memoryOverhead=384m --conf spark.app.name=$APP_NAME --conf spark.extraListeners=ch.cern.sparkmeasure.FlightRecorderTaskMetrics --conf spark.executorEnv.taskMetricsFileName=../spark-stats/$APP_NAME --conf spark.executorEnv.taskMetricsFormat="json" target/basic-dataset-1.0.0-SNAPSHOT-shaded.jar ../data/test-gsod/

echo "Local Basic Dataset. Mid executor + executor overhead memory settings. One thread. Staging Metrics."
CURR_DATE=$(date -u +"%Y-%m-%dT%H:%M:%S.%sZ")
APP_NAME=BasicDatasetRunner-$CURR_DATE
echo $APP_NAME
spark-submit --class cmsc.basic.ds.BasicDatasetRunner --master local[1] --driver-memory 512m --executor-memory 1024m --conf spark.driver.memoryOverhead=384m --conf spark.executor.memoryOverhead=768m --conf spark.app.name=$APP_NAME --conf spark.extraListeners=ch.cern.sparkmeasure.FlightRecorderTaskMetrics --conf spark.executorEnv.taskMetricsFileName=../spark-stats/$APP_NAME --conf spark.executorEnv.taskMetricsFormat="json" target/basic-dataset-1.0.0-SNAPSHOT-shaded.jar ../data/test-gsod/

echo "Local Basic Dataset. High executor + mid executor overhead memory settings. One thread. Staging Metrics."
CURR_DATE=$(date -u +"%Y-%m-%dT%H:%M:%S.%sZ")
APP_NAME=BasicDatasetRunner-$CURR_DATE
echo $APP_NAME
spark-submit --class cmsc.basic.ds.BasicDatasetRunner --master local[1] --driver-memory 512m --executor-memory 2048m --conf spark.driver.memoryOverhead=384m --conf spark.executor.memoryOverhead=768m --conf spark.app.name=$APP_NAME --conf spark.extraListeners=ch.cern.sparkmeasure.FlightRecorderTaskMetrics --conf spark.executorEnv.taskMetricsFileName=../spark-stats/$APP_NAME --conf spark.executorEnv.taskMetricsFormat="json" target/basic-dataset-1.0.0-SNAPSHOT-shaded.jar ../data/test-gsod/

echo "-----"

echo "Local Basic Dataset. Lowest memory settings. Two threads. Staging Metrics."
CURR_DATE=$(date -u +"%Y-%m-%dT%H:%M:%S.%sZ")
APP_NAME=BasicDatasetRunner-$CURR_DATE
echo $APP_NAME
spark-submit --class cmsc.basic.ds.BasicDatasetRunner --master local[2] --driver-memory 512m --executor-memory 512m --conf spark.driver.memoryOverhead=384m --conf spark.executor.memoryOverhead=384m --conf spark.app.name=$APP_NAME --conf spark.extraListeners=ch.cern.sparkmeasure.FlightRecorderTaskMetrics --conf spark.executorEnv.taskMetricsFileName=../spark-stats/$APP_NAME --conf spark.executorEnv.taskMetricsFormat="json" target/basic-dataset-1.0.0-SNAPSHOT-shaded.jar ../data/test-gsod/

echo "Local Basic Dataset. Mid executor memory settings. Two threads. Staging Metrics."
CURR_DATE=$(date -u +"%Y-%m-%dT%H:%M:%S.%sZ")
APP_NAME=BasicDatasetRunner-$CURR_DATE
echo $APP_NAME
spark-submit --class cmsc.basic.ds.BasicDatasetRunner --master local[2] --driver-memory 512m --executor-memory 1024m --conf spark.driver.memoryOverhead=384m --conf spark.executor.memoryOverhead=384m --conf spark.app.name=$APP_NAME --conf spark.extraListeners=ch.cern.sparkmeasure.FlightRecorderTaskMetrics --conf spark.executorEnv.taskMetricsFileName=../spark-stats/$APP_NAME --conf spark.executorEnv.taskMetricsFormat="json" target/basic-dataset-1.0.0-SNAPSHOT-shaded.jar ../data/test-gsod/

echo "Local Basic Dataset. Mid executor + executor overhead memory settings. Two threads. Staging Metrics."
CURR_DATE=$(date -u +"%Y-%m-%dT%H:%M:%S.%sZ")
APP_NAME=BasicDatasetRunner-$CURR_DATE
echo $APP_NAME
spark-submit --class cmsc.basic.ds.BasicDatasetRunner --master local[2] --driver-memory 512m --executor-memory 1024m --conf spark.driver.memoryOverhead=384m --conf spark.executor.memoryOverhead=768m --conf spark.app.name=$APP_NAME --conf spark.extraListeners=ch.cern.sparkmeasure.FlightRecorderTaskMetrics --conf spark.executorEnv.taskMetricsFileName=../spark-stats/$APP_NAME --conf spark.executorEnv.taskMetricsFormat="json" target/basic-dataset-1.0.0-SNAPSHOT-shaded.jar ../data/test-gsod/

echo "Local Basic Dataset. High executor + mid executor overhead memory settings. Two threads. Staging Metrics."
CURR_DATE=$(date -u +"%Y-%m-%dT%H:%M:%S.%sZ")
APP_NAME=BasicDatasetRunner-$CURR_DATE
echo $APP_NAME
spark-submit --class cmsc.basic.ds.BasicDatasetRunner --master local[2] --driver-memory 512m --executor-memory 2048m --conf spark.driver.memoryOverhead=384m --conf spark.executor.memoryOverhead=768m --conf spark.app.name=$APP_NAME --conf spark.extraListeners=ch.cern.sparkmeasure.FlightRecorderTaskMetrics --conf spark.executorEnv.taskMetricsFileName=../spark-stats/$APP_NAME --conf spark.executorEnv.taskMetricsFormat="json" target/basic-dataset-1.0.0-SNAPSHOT-shaded.jar ../data/test-gsod/

echo "-----"

echo "Local Basic Dataset. Lowest memory settings. Three threads. Staging Metrics."
CURR_DATE=$(date -u +"%Y-%m-%dT%H:%M:%S.%sZ")
APP_NAME=BasicDatasetRunner-$CURR_DATE
echo $APP_NAME
spark-submit --class cmsc.basic.ds.BasicDatasetRunner --master local[3] --driver-memory 512m --executor-memory 512m --conf spark.driver.memoryOverhead=384m --conf spark.executor.memoryOverhead=384m --conf spark.app.name=$APP_NAME --conf spark.extraListeners=ch.cern.sparkmeasure.FlightRecorderTaskMetrics --conf spark.executorEnv.taskMetricsFileName=../spark-stats/$APP_NAME --conf spark.executorEnv.taskMetricsFormat="json" target/basic-dataset-1.0.0-SNAPSHOT-shaded.jar ../data/test-gsod/

echo "Local Basic Dataset. Mid executor memory settings. Three threads. Staging Metrics."
CURR_DATE=$(date -u +"%Y-%m-%dT%H:%M:%S.%sZ")
APP_NAME=BasicDatasetRunner-$CURR_DATE
echo $APP_NAME
spark-submit --class cmsc.basic.ds.BasicDatasetRunner --master local[3] --driver-memory 512m --executor-memory 1024m --conf spark.driver.memoryOverhead=384m --conf spark.executor.memoryOverhead=384m --conf spark.app.name=$APP_NAME --conf spark.extraListeners=ch.cern.sparkmeasure.FlightRecorderTaskMetrics --conf spark.executorEnv.taskMetricsFileName=../spark-stats/$APP_NAME --conf spark.executorEnv.taskMetricsFormat="json" target/basic-dataset-1.0.0-SNAPSHOT-shaded.jar ../data/test-gsod/

echo "Local Basic Dataset. Mid executor + executor overhead memory settings. Three threads. Staging Metrics."
CURR_DATE=$(date -u +"%Y-%m-%dT%H:%M:%S.%sZ")
APP_NAME=BasicDatasetRunner-$CURR_DATE
echo $APP_NAME
spark-submit --class cmsc.basic.ds.BasicDatasetRunner --master local[3] --driver-memory 512m --executor-memory 1024m --conf spark.driver.memoryOverhead=384m --conf spark.executor.memoryOverhead=768m --conf spark.app.name=$APP_NAME --conf spark.extraListeners=ch.cern.sparkmeasure.FlightRecorderTaskMetrics --conf spark.executorEnv.taskMetricsFileName=../spark-stats/$APP_NAME --conf spark.executorEnv.taskMetricsFormat="json" target/basic-dataset-1.0.0-SNAPSHOT-shaded.jar ../data/test-gsod/

echo "Local Basic Dataset. High executor + mid executor overhead memory settings. Three threads. Staging Metrics."
CURR_DATE=$(date -u +"%Y-%m-%dT%H:%M:%S.%sZ")
APP_NAME=BasicDatasetRunner-$CURR_DATE
echo $APP_NAME
spark-submit --class cmsc.basic.ds.BasicDatasetRunner --master local[3] --driver-memory 512m --executor-memory 2048m --conf spark.driver.memoryOverhead=384m --conf spark.executor.memoryOverhead=768m --conf spark.app.name=$APP_NAME --conf spark.extraListeners=ch.cern.sparkmeasure.FlightRecorderTaskMetrics --conf spark.executorEnv.taskMetricsFileName=../spark-stats/$APP_NAME --conf spark.executorEnv.taskMetricsFormat="json" target/basic-dataset-1.0.0-SNAPSHOT-shaded.jar ../data/test-gsod/

echo "-----"

echo "Local Basic Dataset. Lowest memory settings. Four threads. Staging Metrics."
CURR_DATE=$(date -u +"%Y-%m-%dT%H:%M:%S.%sZ")
APP_NAME=BasicDatasetRunner-$CURR_DATE
echo $APP_NAME
spark-submit --class cmsc.basic.ds.BasicDatasetRunner --master local[4] --driver-memory 512m --executor-memory 512m --conf spark.driver.memoryOverhead=384m --conf spark.executor.memoryOverhead=384m --conf spark.app.name=$APP_NAME --conf spark.extraListeners=ch.cern.sparkmeasure.FlightRecorderTaskMetrics --conf spark.executorEnv.taskMetricsFileName=../spark-stats/$APP_NAME --conf spark.executorEnv.taskMetricsFormat="json" target/basic-dataset-1.0.0-SNAPSHOT-shaded.jar ../data/test-gsod/

echo "Local Basic Dataset. Mid executor memory settings. Four threads. Staging Metrics."
CURR_DATE=$(date -u +"%Y-%m-%dT%H:%M:%S.%sZ")
APP_NAME=BasicDatasetRunner-$CURR_DATE
echo $APP_NAME
spark-submit --class cmsc.basic.ds.BasicDatasetRunner --master local[4] --driver-memory 512m --executor-memory 1024m --conf spark.driver.memoryOverhead=384m --conf spark.executor.memoryOverhead=384m --conf spark.app.name=$APP_NAME --conf spark.extraListeners=ch.cern.sparkmeasure.FlightRecorderTaskMetrics --conf spark.executorEnv.taskMetricsFileName=../spark-stats/$APP_NAME --conf spark.executorEnv.taskMetricsFormat="json" target/basic-dataset-1.0.0-SNAPSHOT-shaded.jar ../data/test-gsod/

echo "Local Basic Dataset. Mid executor + executor overhead memory settings. Four threads. Staging Metrics."
CURR_DATE=$(date -u +"%Y-%m-%dT%H:%M:%S.%sZ")
APP_NAME=BasicDatasetRunner-$CURR_DATE
echo $APP_NAME
spark-submit --class cmsc.basic.ds.BasicDatasetRunner --master local[4] --driver-memory 512m --executor-memory 1024m --conf spark.driver.memoryOverhead=384m --conf spark.executor.memoryOverhead=768m --conf spark.app.name=$APP_NAME --conf spark.extraListeners=ch.cern.sparkmeasure.FlightRecorderTaskMetrics --conf spark.executorEnv.taskMetricsFileName=../spark-stats/$APP_NAME --conf spark.executorEnv.taskMetricsFormat="json" target/basic-dataset-1.0.0-SNAPSHOT-shaded.jar ../data/test-gsod/

echo "Local Basic Dataset. High executor + mid executor overhead memory settings. Four threads. Staging Metrics."
CURR_DATE=$(date -u +"%Y-%m-%dT%H:%M:%S.%sZ")
APP_NAME=BasicDatasetRunner-$CURR_DATE
echo $APP_NAME
spark-submit --class cmsc.basic.ds.BasicDatasetRunner --master local[4] --driver-memory 512m --executor-memory 2048m --conf spark.driver.memoryOverhead=384m --conf spark.executor.memoryOverhead=768m --conf spark.app.name=$APP_NAME --conf spark.extraListeners=ch.cern.sparkmeasure.FlightRecorderTaskMetrics --conf spark.executorEnv.taskMetricsFileName=../spark-stats/$APP_NAME --conf spark.executorEnv.taskMetricsFormat="json" target/basic-dataset-1.0.0-SNAPSHOT-shaded.jar ../data/test-gsod/

echo "-----End Task Metrics-----"