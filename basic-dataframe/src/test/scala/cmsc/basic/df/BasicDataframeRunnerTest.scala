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
        "999999 54932  20180101   -11.2 24  9999.9  0  9999.9  0  9999.9  0  999.9  0  999.9  0  999.9  999.9     2.8   -20.4   0.00G 999.9  000000",
        "999999 54931  20180102    -3.7 24  9999.9  0  9999.9  0  9999.9  0  999.9  0  999.9  0  999.9  999.9    12.0*  -11.7   0.00G 999.9  000000",
        "999991 54932  20180103     2.6 24  9999.9  0  9999.9  0  9999.9  0  999.9  0  999.9  0  999.9  999.9    12.0    -3.6   0.00G 999.9  000000",
        "999991 54931  20180104    -9.2 24  9999.9  0  9999.9  0  9999.9  0  999.9  0  999.9  0  999.9  999.9     1.6   -19.7   0.00G 999.9  000000",
        "999999 54932  20180105   -12.3 24  9999.9  0  9999.9  0  9999.9  0  999.9  0  999.9  0  999.9  999.9     1.8   -22.4   0.00G 999.9  000000"
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
