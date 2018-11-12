package cmsc.basic.rdd

import org.apache.spark.SparkConf
import org.apache.spark.sql.SparkSession

object BasicRDDRunner {

  def main(args: Array[String]): Unit = {
    implicit val sparkSession: SparkSession = SparkSession.builder().config(new SparkConf()).getOrCreate()

    try {
      println(args)
    } finally {
      sparkSession.stop()
    }
  }
}
