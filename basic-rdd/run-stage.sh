#!/usr/bin/env bash
# We use the following commands before each run to ensure the app id is unique
#CURR_DATE=$(date -u +"%Y-%m-%dT%H:%M:%S.%sZ") && APP_NAME=BasicRDDRunner-$CURR_DATE

#No metrics
#CURR_DATE=$(date -u +"%Y-%m-%dT%H:%M:%S.%sZ") && APP_NAME=BasicRDDRunner-$CURR_DATE && spark-submit --class cmsc.basic.rdd.BasicRDDRunner --master local[2] --conf spark.app.name=$APP_NAME target/basic-rdd-1.0.0-SNAPSHOT-shaded.jar ../data/test-gsod/

#This is the Stage metrics, but I don't think we need these.
#Single File
CURR_DATE=$(date -u +"%Y-%m-%dT%H:%M:%S.%sZ") && APP_NAME=BasicRDDRunner-$CURR_DATE && /opt/spark/spark-2.1.0-bin-hadoop2.7/bin/spark-submit --class cmsc.basic.rdd.BasicRDDRunner --master yarn --deploy-mode cluster --conf spark.app.name=$APP_NAME --conf spark.extraListeners=ch.cern.sparkmeasure.FlightRecorderStageMetrics --conf spark.executorEnv.stageMetricsFileName=/tmp/school/stats/$APP_NAME --conf spark.executorEnv.stageMetricsFormat="json" hdfs://nameservice1/school/jars/basic-rdd-1.0.0-SNAPSHOT-shaded.jar hdfs://nameservice1/school/data/*/

#All test files
#CURR_DATE=$(date -u +"%Y-%m-%dT%H:%M:%S.%sZ") && APP_NAME=BasicRDDRunner-$CURR_DATE && spark-submit --class cmsc.basic.rdd.BasicRDDRunner --master local[1] --conf spark.app.name=$APP_NAME --conf spark.extraListeners=ch.cern.sparkmeasure.FlightRecorderStageMetrics --conf spark.executorEnv.stageMetricsFileName=/tmp/spark-stats/$APP_NAME --conf spark.executorEnv.stageMetricsFormat="json" target/basic-rdd-1.0.0-SNAPSHOT-shaded.jar ../data/test-gsod/

CURR_DATE=$(date -u +"%Y-%m-%dT%H:%M:%S.%sZ") && APP_NAME=BasicRDDRunner-$CURR_DATE && /opt/spark/spark-2.1.0-bin-hadoop2.7/bin/spark-submit --class cmsc.basic.rdd.BasicRDDRunner --master yarn --deploy-mode cluster --conf spark.app.name=$APP_NAME hdfs://nameservice1/school/jars/basic-rdd-1.0.0-SNAPSHOT-shaded.jar hdfs://nameservice1/school/data/*/
