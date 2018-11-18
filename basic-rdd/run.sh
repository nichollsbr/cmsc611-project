#!/usr/bin/env bash
spark-submit --class cmsc.basic.rdd.BasicRDDRunner --master local[1] target/basic-rdd-1.0.0-SNAPSHOT-shaded.jar ../data/test-gsod/
