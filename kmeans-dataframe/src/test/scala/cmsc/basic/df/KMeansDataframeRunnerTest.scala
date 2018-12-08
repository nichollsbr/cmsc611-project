package cmsc.basic.df;

import org.apache.spark.SparkConf
import org.apache.spark.sql.types._
import org.apache.spark.sql.{DataFrame, Row, SparkSession}
import org.junit.{BeforeClass, Test}
import org.junit.Assert._
import KMeansDataframeRunner._

object KMeansDataframeRunnerTest {
  implicit var sparkSession: SparkSession = _

  var testDataframe: DataFrame = _

  @BeforeClass
  def beforeClass(): Unit = {
    sparkSession = SparkSession.builder().config(new SparkConf()).master("local").getOrCreate()

    val schema = StructType(columnNames.map(name =>
      name match {
        case "temp"|"dewp"|"slp"|"stp"|"visib"|"wdsp"|"mxSpd"|"gust"|"sndp" => StructField(name, DoubleType)
        case "stn"|"frshtt"|"wban"|"day"|"countTemp"|"countDewp"|"countSlp"|"countStp"|"countVisib"|"countWdsp" => StructField(name, IntegerType)
        case _ => StructField(name, StringType)
    }))

    val testRDD = sparkSession.sparkContext.parallelize(
      Seq(
        "999999,96409,20180101,-9.7,24,9999.9,0,9999.9,0,9999.9,0,999.9,0,999.9,0,999.9,999.9,-5.3*,-15.7,0.00G,999.9,000000",
        "999999,96409,20180102,6.7,24,9999.9,0,9999.9,0,9999.9,0,999.9,0,999.9,0,999.9,999.9,24.4*,-9.6,0.01G,999.9,000000",
        "999999,96409,20180103,23.9,24,9999.9,0,9999.9,0,9999.9,0,999.9,0,999.9,0,999.9,999.9,28.8,14.5,0.00G,999.9,000000",
        "999999,96409,20180104,22.6,24,9999.9,0,9999.9,0,9999.9,0,999.9,0,999.9,0,999.9,999.9,26.6,18.9,0.00G,999.9,000000",
        "999999,96409,20180105,11.4,24,9999.9,0,9999.9,0,9999.9,0,999.9,0,999.9,0,999.9,999.9,24.1,-1.5,0.00G,999.9,000000",
        "999999,96409,20180105,0,24,9999.9,0,9999.9,0,9999.9,0,999.9,0,999.9,0,999.9,999.9,24.1,-1.5,0.00G,999.9,000000",
        "999999,96409,20180105,0.05,24,9999.9,0,9999.9,0,9999.9,0,999.9,0,999.9,0,999.9,999.9,24.1,-1.5,0.00G,999.9,000000",
        "999999,96409,20180105,-12.5,24,9999.9,0,9999.9,0,9999.9,0,999.9,0,999.9,0,999.9,999.9,24.1,-1.5,0.00G,999.9,000000"
    )).map(s => {
      val splitString = s.split(",").toList
      val intIndicies = Set(0,1,2,4,6,8,10,12,14,21)
      val doubleIndicies = Set(3,5,7,9,11,13,15,16,20)
      val fixedList = splitString.zipWithIndex.map{case (value: String, index: Int) => {
        if(intIndicies.contains(index))
          value.toInt
        else if(doubleIndicies.contains(index))
          value.toDouble
        else
          value
      }}
      Row.fromSeq(fixedList)
    })

    testDataframe = sparkSession.createDataFrame(testRDD, schema)
  }
}

class KMeansDataframeRunnerTest {

  import KMeansDataframeRunnerTest._

  @Test
  def testAnalytic(): Unit = {
    val analytic = new KMeansDataframeRunner()
    val results = analytic.run(testDataframe)
    results.clusterCenters.foreach(println)
    assertEquals(8, results.clusterCenters.size)
  }
}
