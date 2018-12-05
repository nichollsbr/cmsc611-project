package cmsc.basic.ds

import java.io.File

import org.apache.spark.SparkConf
import org.apache.spark.sql.{Dataset, SparkSession}

object BasicDatasetRunner {

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

  case class Record(stn: Int,
                    wban: Int,
                    day: Int,
                    temp: Double,
                    countTemp: Int,
                    dewp: Double,
                    countDewp: Int,
                    slp: Double,
                    countSlp: Int,
                    stp: Double,
                    countStp: Int,
                    visib: Double,
                    countVisib: Int,
                    wdsp: Double,
                    countWdsp: Int,
                    mxSpd: Double,
                    gust: Double,
                    maxTemp: String,
                    minTemp: String,
                    prcp: String,
                    sndp: Double,
                    frshtt: Int)

  def main(args: Array[String]): Unit = {
    val sparkConf = new SparkConf().set("spark.eventLog.enabled", "true")
    implicit val sparkSession: SparkSession = SparkSession.builder().config(sparkConf).getOrCreate()
    sparkSession.sparkContext.setLogLevel("WARN")

    try {
      val analytic = new BasicDatasetRunner
      val data = readData(args(0))
//      data.printSchema()
      val results = analytic.run(data)
      println(results.count())
//      results.show()
    } finally {
      sparkSession.stop()
    }
  }

  def readData(dataLoc: String)(implicit sparkSession: SparkSession)= {
    import sparkSession.implicits._

    val file = new File(dataLoc)
    sparkSession.read
      .option("sep", ",")
      .option("inferSchema", true)
      .option("ignoreLeadingWhiteSpace", true)
      .option("ignoreTrailingWhiteSpace", true)
      //      .option("dateFormat", "yyyyMMdd")
      .csv(file.getAbsolutePath)
      .toDF(columnNames:_*)
      .as[Record]
  }
}

class BasicDatasetRunner {
  import BasicDatasetRunner._

  def run(rawData: Dataset[Record])(implicit sparkSession: SparkSession) = {
    import sparkSession.implicits._

    rawData
      .groupByKey(rec => {
        val r = rec.temp % 10
        val pmod = if (r < 0) (r + 10) % 10 else r
        (rec.stn, (rec.temp - pmod).toInt)
      })
      .count()
  }
}
