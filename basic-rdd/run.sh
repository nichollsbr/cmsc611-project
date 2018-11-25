#!/usr/bin/env bash
# We use the following commands before each run to ensure the app id is unique
#CURR_DATE=$(date -u +"%Y-%m-%dT%H:%M:%S.%sZ") && APP_NAME=BasicDataframeRunner-$CURR_DATE

#No metrics
#CURR_DATE=$(date -u +"%Y-%m-%dT%H:%M:%S.%sZ") && APP_NAME=BasicDataframeRunner-$CURR_DATE && spark-submit --class cmsc.basic.rdd.BasicRDDRunner --master local[2] --conf spark.app.name=$APP_NAME target/basic-rdd-1.0.0-SNAPSHOT-shaded.jar ../data/test-gsod/

#This is the Stage metrics, but I don't think we need these.
#Single File
#CURR_DATE=$(date -u +"%Y-%m-%dT%H:%M:%S.%sZ") && APP_NAME=BasicDataframeRunner-$CURR_DATE && spark-submit --class cmsc.basic.rdd.BasicRDDRunner --master local[1] --conf spark.app.name=$APP_NAME --conf spark.extraListeners=ch.cern.sparkmeasure.FlightRecorderStageMetrics --conf spark.executorEnv.stageMetricsFileName=/tmp/$APP_NAME --conf spark.executorEnv.stageMetricsFormat="json" target/basic-rdd-1.0.0-SNAPSHOT-shaded.jar ../data/test-gsod/010010-99999-2018.op.csv.gz

#All test files
CURR_DATE=$(date -u +"%Y-%m-%dT%H:%M:%S.%sZ") && APP_NAME=BasicDataframeRunner-$CURR_DATE && spark-submit --class cmsc.basic.rdd.BasicRDDRunner --master local[1] --conf spark.app.name=$APP_NAME --conf spark.extraListeners=ch.cern.sparkmeasure.FlightRecorderStageMetrics --conf spark.executorEnv.stageMetricsFileName=/tmp/$APP_NAME --conf spark.executorEnv.stageMetricsFormat="json" target/basic-rdd-1.0.0-SNAPSHOT-shaded.jar ../data/test-gsod/
