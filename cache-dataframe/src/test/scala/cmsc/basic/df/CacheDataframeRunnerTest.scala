package cmsc.basic.df;

import org.apache.spark.SparkConf
import org.apache.spark.sql.types.{DoubleType, StringType, StructField, StructType}
import org.apache.spark.sql.{DataFrame, Row, SparkSession}
import org.junit.{BeforeClass, Test}
import org.junit.Assert._
import CacheDataframeRunner._

object CacheDataframeRunnerTest {
  implicit var sparkSession: SparkSession = _

  var testDataframe: DataFrame = _

  @BeforeClass
  def beforeClass(): Unit = {
    sparkSession = SparkSession.builder().config(new SparkConf()).master("local").getOrCreate()

    val schema = StructType(columnNames.map(name => {
      name match {
        case "temp" => StructField(name, DoubleType)
        case _ => StructField(name, StringType)
      }
    }))

    testDataframe = sparkSession.createDataFrame(sparkSession.sparkContext.parallelize(
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
      val fixedList = splitString.zipWithIndex.map{case (value: String, index: Int) => {
        index match {
          case 3 => value.toDouble
          case _ => value
        }
      }}
      Row.fromSeq(fixedList)
    }), schema)
  }
}

class CacheDataframeRunnerTest {

  import CacheDataframeRunnerTest._

  @Test
  def testAnalytic(): Unit = {
    val analytic = new CacheDataframeRunner()
    val results = analytic.run(testDataframe)
    results.show()
    assertEquals(5l, results.count())
  }
}
