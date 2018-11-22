package cmsc.basic.df

import java.io.File

import org.apache.spark.SparkConf
import org.apache.spark.sql.{DataFrame, SparkSession}

object BasicDataframeRunner {

  def main(args: Array[String]): Unit = {
    val sparkConf = new SparkConf().set("spark.eventLog.enabled", "true")
    implicit val sparkSession: SparkSession = SparkSession.builder().config(sparkConf).getOrCreate()
    sparkSession.sparkContext.setLogLevel("WARN")

    try {
      //Work on this part
      val analytic = new BasicDataframeRunner
      val data = readData(args(0))
      val results = analytic.run(data)
      results.printSchema()
      println(results.count())
    } finally {
      sparkSession.stop()
    }
  }

  //Keep improving
  def readData(dataLoc: String)(implicit sparkSession: SparkSession)= {
    val file = new File(dataLoc)
    sparkSession.read.option("header", true).csv(file.getAbsolutePath)
  }
}

class BasicDataframeRunner {
  def run(rawData: DataFrame) : DataFrame = {
    rawData
//    rawData
//      .mapPartitions(iter => iter.map(s => {
//      val key = s.split("\\s+")
//      (key(0) + " " + key(1), 1l)
//    }))
//      .aggregateByKey(0l)(_+_, _+_)
  }
}
