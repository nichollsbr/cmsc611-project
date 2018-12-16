package cmsc.basic.df

import java.io.File

import org.apache.spark.SparkConf
import org.apache.spark.sql.{DataFrame, SparkSession}
import org.apache.spark.sql.functions._
import org.apache.spark.sql.types.IntegerType

object PartitionDataframeRunner {

  val columnNames = Seq(
    "stn", //station number
    "wban", //historical Weather Bureau Air Force Navy
    "day", //yyyyMMdd
    "temp", //average temp
    "countTemp", //number of results to calculate TEMP
    "dewp", //average dew point
    "countDewp", //number of results to calculate DEWP
    "slp", //average sea level pressure
    "countSlp", //number of results to calculate SLP
    "stp", //average station pressure
    "countStp", //number of results to calculate STP
    "visib", //average visibility
    "countVisib", //number of results to calculate VISIB
    "wdsp", //average wind speed
    "countWdsp", //number of results to calculate WDSP
    "mxSpd", //max wind speed
    "gust", //max gust speed
    "maxTemp", //max temp
    "minTemp", //min temp
    "prcp", //precipitation
    "sndp", //snow depth
    "frshtt" //Indicators of For, Rain/Drizzle, Snow/Ice Pellets, Hail, Thunder, Tornado/Funnel Cloud
  )

  def main(args: Array[String]): Unit = {
    val sparkConf = new SparkConf().set("spark.eventLog.enabled", "true")
    implicit val sparkSession: SparkSession = SparkSession.builder().config(sparkConf).getOrCreate()
    sparkSession.sparkContext.setLogLevel("WARN")

    try {
      val analytic = new PartitionDataframeRunner
      val data = readData(args(0))
      val partitions = args(1).toInt
//      data.printSchema()
      val results = analytic.run(data, partitions)
      println(results.count())
//      results.show()
    } finally {
      sparkSession.stop()
    }
  }

  //Keep improving
  def readData(dataLoc: String)(implicit sparkSession: SparkSession)= {
    sparkSession.read
      .option("sep", ",")
      .option("inferSchema", true)
      .option("ignoreLeadingWhiteSpace", true)
      .option("ignoreTrailingWhiteSpace", true)
//      .option("dateFormat", "yyyyMMdd")
      .csv(dataLoc)
      .toDF(columnNames:_*)
  }
}

class PartitionDataframeRunner {
  import PartitionDataframeRunner._

  def run(rawData: DataFrame, n: Int) : DataFrame = {
    rawData
      .coalesce(n)
      .groupBy(col("stn"), (col("temp") - pmod(col("temp"), lit(10))).as("TEMP_BUCKET").cast(IntegerType))
      .count()
  }
}
