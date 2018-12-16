package cmsc.basic.rdd

import java.io.File

import org.apache.spark.SparkConf
import org.apache.spark.rdd.RDD
import org.apache.spark.sql.SparkSession

object CacheRDDRunner {

  def main(args: Array[String]): Unit = {
    val sparkConf = new SparkConf().set("spark.eventLog.enabled", "true")
    implicit val sparkSession: SparkSession = SparkSession.builder().config(sparkConf).getOrCreate()
    sparkSession.sparkContext.setLogLevel("WARN")

    try {
      val analytic = new CacheRDDRunner
      val data = readData(args(0)).cache()
      //The print of the count below forces the whole job to run.
      println(analytic.run(data).count())
    } finally {
      sparkSession.stop()
    }
  }

  def readData(dataLoc: String)(implicit sparkSession: SparkSession)= {
    sparkSession.sparkContext.textFile(dataLoc)
  }
}

class CacheRDDRunner {
  /*
   * Group by the station number and the bucket of the mean temperature of the day (i.e. the lowest value of 10s to the
   * mean temperature.
   *
   * It'd be great if we could get numbers between -10 and 0 to map to -10 bucket, but that can be a later issue.
   */
  def run(rawData: RDD[String]) : RDD[((String, Int), Long)] = {
    rawData
      .mapPartitions(iter => iter.map(s => {
        val key = s.split(",")
        val temp = key(3).toDouble
        val r = temp % 10
        val pmod = if (r < 0) (r + 10) % 10 else r
        ((key(0), (temp - pmod).toInt), 1l)
    }))
      .aggregateByKey(0l)(_+_, _+_)
  }
}
