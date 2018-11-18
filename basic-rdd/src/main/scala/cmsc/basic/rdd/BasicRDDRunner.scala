package cmsc.basic.rdd

import java.io.File

import org.apache.spark.SparkConf
import org.apache.spark.rdd.RDD
import org.apache.spark.sql.SparkSession

object BasicRDDRunner {

  def main(args: Array[String]): Unit = {
    val sparkConf = new SparkConf().set("spark.eventLog.enabled", "true")
    implicit val sparkSession: SparkSession = SparkSession.builder().config(sparkConf).getOrCreate()

    try {
      //Work on this part
      val analytic = new BasicRDDRunner
      val data = readData(args(0))
      println(analytic.run(data).count())
    } finally {
      sparkSession.stop()
    }
  }

  //Keep improving
  def readData(dataLoc: String)(implicit sparkSession: SparkSession)= {
    val file = new File(dataLoc)
    sparkSession.sparkContext.textFile(file.getAbsolutePath)
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
