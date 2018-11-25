package cmsc.basic.df

import java.io.File

import org.apache.spark.SparkConf
import org.apache.spark.sql.{DataFrame, SparkSession}
import org.apache.spark.sql.functions._

object BasicDataframeRunner {

  val columnNames = Seq(
    "STN", //station number
    "WBAN", //historical Weather Bureau Air Force Navy
    "DAY", //yyyyMMdd
    "TEMP", //average temp
    "COUNT_TEMP", //number of results to calculate TEMP
    "DEWP", //average dew point
    "COUNT_DEWP", //number of results to calculate DEWP
    "SLP", //average sea level pressure
    "COUNT_SLP", //number of results to calculate SLP
    "STP", //average station pressure
    "COUNT_STP", //number of results to calculate STP
    "VISIB", //average visibility
    "COUNT_VISIB", //number of results to calculate VISIB
    "WDSP", //average wind speed
    "COUNT_WDSP", //number of results to calculate WDSP
    "MXSPD", //max wind speed
    "GUST", //max gust speed
    "MAX_TEMP" //max temp
  )

  def main(args: Array[String]): Unit = {
    val sparkConf = new SparkConf().set("spark.eventLog.enabled", "true")
    implicit val sparkSession: SparkSession = SparkSession.builder().config(sparkConf).getOrCreate()
    sparkSession.sparkContext.setLogLevel("WARN")

    try {
      val analytic = new BasicDataframeRunner
      val data = readData(args(0))
      data.printSchema()
      val results = analytic.run(data)
      results.show()
    } finally {
      sparkSession.stop()
    }
  }

  //Keep improving
  def readData(dataLoc: String)(implicit sparkSession: SparkSession)= {
    val file = new File(dataLoc)
    sparkSession.read
      .option("sep", ",")
      .option("inferSchema", true)
      .option("ignoreLeadingWhiteSpace", true)
      .option("ignoreTrailingWhiteSpace", true)
      .csv(file.getAbsolutePath)
  }
}

class BasicDataframeRunner {
  import BasicDataframeRunner._

  def run(rawData: DataFrame) : DataFrame = {
    rawData
      .select(rawData.columns.zip(columnNames).map{ case (oldName: String, newName: String) => col(oldName).as(newName)} : _*)
      .groupBy(col("STN"), (col("TEMP") - pmod(col("TEMP"), lit(10))).as("TEMP_BUCKET"))
      .count()
  }
}
