package cmsc.basic.rdd;

import java.io.File

import org.apache.spark.SparkConf
import org.apache.spark.sql.SparkSession
import org.junit.{BeforeClass, Test};
import org.junit.Assert._

object BasicRDDRunnerTest {
  implicit var sparkSession: SparkSession = _

  @BeforeClass
  def beforeClass(): Unit = {
    sparkSession = SparkSession.builder().config(new SparkConf()).master("local").getOrCreate()
  }
}

class BasicRDDRunnerTest {

  import BasicRDDRunnerTest._

  @Test
  def testAnalytic(): Unit = {
    val file = new File("../data/test-gsod")
//    println(file.getAbsolutePath)
//    assertEquals("hi", file.getAbsolutePath)
    val rdd = sparkSession.sparkContext.textFile(file.getAbsolutePath)
    rdd.take(10).foreach(println)
  }
}
