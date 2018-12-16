package cmsc.basic.ds

import java.io.File

import org.apache.spark.SparkConf
import org.apache.spark.sql.{Dataset, SparkSession}
import org.apache.spark.ml.clustering.{KMeans, KMeansModel}
import org.apache.spark.ml.feature.VectorAssembler

object KMeansDatasetRunner {

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
      val analytic = new KMeansDatasetRunner
      val data = readData(args(0))
//      data.printSchema()
      val model = analytic.run(data)
      model.clusterCenters.foreach(println)
//      results.show()
    } finally {
      sparkSession.stop()
    }
  }

  def readData(dataLoc: String)(implicit sparkSession: SparkSession)= {
    import sparkSession.implicits._

    sparkSession.read
      .option("sep", ",")
      .option("inferSchema", true)
      .option("ignoreLeadingWhiteSpace", true)
      .option("ignoreTrailingWhiteSpace", true)
      //      .option("dateFormat", "yyyyMMdd")
      .csv(dataLoc)
      .toDF(columnNames:_*)
      .as[Record]
  }
}

class KMeansDatasetRunner {
  import KMeansDatasetRunner._

  def run(rawData: Dataset[Record])(implicit sparkSession: SparkSession) = {
    import sparkSession.implicits._
    val kmeans = new KMeans().setK(10).setSeed(1L)

    val vectorAssembler = new VectorAssembler()
      .setInputCols(Array("temp", "dewp", "slp", "stp", "visib", "wdsp", "mxSpd", "sndp"))
      .setOutputCol("features")

    val workableData = vectorAssembler.transform(rawData).cache()

    kmeans.fit(workableData)
  }
}
