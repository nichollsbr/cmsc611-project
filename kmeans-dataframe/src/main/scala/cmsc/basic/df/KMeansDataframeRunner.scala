package cmsc.basic.df

import java.io.File

import org.apache.spark.SparkConf
import org.apache.spark.sql.{DataFrame, SparkSession}
import org.apache.spark.sql.functions._
import org.apache.spark.sql.types.{IntegerType, SQLUserDefinedType, StringType}
import org.apache.spark.ml.clustering.{KMeans, KMeansModel}
import org.apache.spark.ml.feature.VectorAssembler
import org.apache.spark.ml.linalg.VectorUDT

//|-- stn: integer (nullable = true)
//|-- wban: integer (nullable = true)
//|-- day: integer (nullable = true)
//|-- temp: double (nullable = true)
//|-- countTemp: integer (nullable = true)
//|-- dewp: double (nullable = true)
//|-- countDewp: integer (nullable = true)
//|-- slp: double (nullable = true)
//|-- countSlp: integer (nullable = true)
//|-- stp: double (nullable = true)
//|-- countStp: integer (nullable = true)
//|-- visib: double (nullable = true)
//|-- countVisib: integer (nullable = true)
//|-- wdsp: double (nullable = true)
//|-- countWdsp: integer (nullable = true)
//|-- mxSpd: double (nullable = true)
//|-- gust: double (nullable = true)
//|-- maxTemp: string (nullable = true)
//|-- minTemp: string (nullable = true)
//|-- prcp: string (nullable = true)
//|-- sndp: double (nullable = true)
//|-- frshtt: integer (nullable = true)

object KMeansDataframeRunner {

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
      val analytic = new KMeansDataframeRunner
      val data = readData(args(0))
//      data.printSchema()
      val model = analytic.run(data)
      model.clusterCenters.foreach(println)
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
//      .option("dateFormat", "yyyyMMdd")
      .csv(file.getAbsolutePath)
      .toDF(columnNames:_*)
  }
}

class KMeansDataframeRunner {
  import KMeansDataframeRunner._

  def run(rawData: DataFrame) : KMeansModel = {
    val kmeans = new KMeans().setK(10).setSeed(1L)

    val vectorAssembler = new VectorAssembler()
      .setInputCols(Array("temp", "dewp", "slp", "stp", "visib", "wdsp", "mxSpd", "sndp"))
      .setOutputCol("features")

    val workableData = vectorAssembler.transform(rawData).cache()

    kmeans.fit(workableData)
  }
}
