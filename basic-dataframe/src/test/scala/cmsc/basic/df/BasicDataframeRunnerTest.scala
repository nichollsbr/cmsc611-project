//package cmsc.basic.df;
//
//import java.io.File
//
//import org.apache.spark.SparkConf
//import org.apache.spark.rdd.RDD
//import org.apache.spark.sql.types.{IntegerType, StructField, StructType}
//import org.apache.spark.sql.{DataFrame, Row, SparkSession}
//import org.junit.{BeforeClass, Test}
//import org.junit.Assert._
//
//object BasicDataframeRunnerTest {
//  implicit var sparkSession: SparkSession = _
//
//  var testDataframe: DataFrame = _
//
//  @BeforeClass
//  def beforeClass(): Unit = {
//    sparkSession = SparkSession.builder().config(new SparkConf()).master("local").getOrCreate()
//
//    val schema = StructType(Seq(
//      StructField("STN", IntegerType) //station number
////      "WBAN", //historical Weather Bureau Air Force Navy
////      "DAY", //yyyyMMdd
////      "TEMP", //average temp
////      "COUNT_TEMP", //number of results to calculate TEMP
////      "DEWP", //average dew point
////      "COUNT_DEWP", //number of results to calculate DEWP
////      "SLP", //average sea level pressure
////      "COUNT_SLP", //number of results to calculate SLP
////      "STP", //average station pressure
////      "COUNT_STP", //number of results to calculate STP
////      "VISIB", //average visibility
////      "COUNT_VISIB", //number of results to calculate VISIB
////      "WDSP", //average wind speed
////      "COUNT_WDSP", //number of results to calculate WDSP
////      "MXSPD", //max wind speed
////      "GUST", //max gust speed
////      "MAX_TEMP" //max temp
//
//      ))
//    testDataframe = sparkSession.createDataFrame(sparkSession.sparkContext.parallelize(
//      Seq(
//        "999999,96409,20180101,-9.7,24,9999.9,0,9999.9,0,9999.9,0,999.9,0,999.9,0,999.9,999.9,-5.3*,-15.7,0.00G,999.9,000000",
//        "999999,96409,20180102,6.7,24,9999.9,0,9999.9,0,9999.9,0,999.9,0,999.9,0,999.9,999.9,24.4*,-9.6,0.01G,999.9,000000",
//        "999999,96409,20180103,23.9,24,9999.9,0,9999.9,0,9999.9,0,999.9,0,999.9,0,999.9,999.9,28.8,14.5,0.00G,999.9,000000",
//        "999999,96409,20180104,22.6,24,9999.9,0,9999.9,0,9999.9,0,999.9,0,999.9,0,999.9,999.9,26.6,18.9,0.00G,999.9,000000",
//        "999999,96409,20180105,11.4,24,9999.9,0,9999.9,0,9999.9,0,999.9,0,999.9,0,999.9,999.9,24.1,-1.5,0.00G,999.9,000000"
//    )).map(s => Row.fromSeq(s.split(","))), schema)
//  }
//}
//
//class BasicDataframeRunnerTest {
//
//  import BasicDataframeRunnerTest._
//
//  @Test
//  def testAnalytic(): Unit = {
////    val analytic = new BasicDataframeRunnerTest()
////    val results = analytic.run(testRDD)
////    assertEquals(4l, results.count())
//
//  }
//}
