package cmsc.basic.df;

import java.io.File

import org.apache.spark.SparkConf
import org.apache.spark.rdd.RDD
import org.apache.spark.sql.SparkSession
import org.junit.{BeforeClass, Test}
import org.junit.Assert._

object BasicDataframeRunnerTest {
  implicit var sparkSession: SparkSession = _

  var testRDD: RDD[String] = _

  @BeforeClass
  def beforeClass(): Unit = {
    sparkSession = SparkSession.builder().config(new SparkConf()).master("local").getOrCreate()
    testRDD = sparkSession.sparkContext.parallelize(
      Seq(
        "999999,96409,20180101,-9.7,24,9999.9,0,9999.9,0,9999.9,0,999.9,0,999.9,0,999.9,999.9,-5.3*,-15.7,0.00G,999.9,000000",
        "999999,96409,20180102,6.7,24,9999.9,0,9999.9,0,9999.9,0,999.9,0,999.9,0,999.9,999.9,24.4*,-9.6,0.01G,999.9,000000",
        "999999,96409,20180103,23.9,24,9999.9,0,9999.9,0,9999.9,0,999.9,0,999.9,0,999.9,999.9,28.8,14.5,0.00G,999.9,000000",
        "999999,96409,20180104,22.6,24,9999.9,0,9999.9,0,9999.9,0,999.9,0,999.9,0,999.9,999.9,26.6,18.9,0.00G,999.9,000000",
        "999999,96409,20180105,11.4,24,9999.9,0,9999.9,0,9999.9,0,999.9,0,999.9,0,999.9,999.9,24.1,-1.5,0.00G,999.9,000000"
    ))
  }
}

class BasicDataframeRunnerTest {

  import BasicDataframeRunnerTest._

  @Test
  def testAnalytic(): Unit = {
//    val analytic = new BasicDataframeRunnerTest()
//    val results = analytic.run(testRDD)
//    results.foreach(println)
//    assertEquals(4l, results.count())

  }
}
