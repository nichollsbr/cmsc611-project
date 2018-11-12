package cmsc.basic.rdd

import java.io.File

import org.apache.spark.SparkConf
import org.apache.spark.rdd.RDD
import org.apache.spark.sql.SparkSession

object BasicRDDRunner {

  def main(args: Array[String]): Unit = {
    implicit val sparkSession: SparkSession = SparkSession.builder().config(new SparkConf()).getOrCreate()

    try {
      //Work on this part
    } finally {
      sparkSession.stop()
    }
  }

  //Keep improving
  def readData()(sparkSession: SparkSession)= {
    val file = new File("../data/test-gsod")
    val rdd = sparkSession.sparkContext.textFile(file.getAbsolutePath)
  }
}

class BasicRDDRunner {
  def run(rawData: RDD[String]) : RDD[(String, Long)] = {
    rawData
      .mapPartitions(iter => iter.map(s => {
      val key = s.split("\\s+")
      (key(0) + " " + key(1), 1l)
    }))
      .aggregateByKey(0l)(_+_, _+_)
  }
}
