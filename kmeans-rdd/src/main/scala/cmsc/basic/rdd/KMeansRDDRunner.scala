package cmsc.basic.rdd

import java.io.File

import org.apache.spark.SparkConf
import org.apache.spark.mllib.clustering.KMeans
import org.apache.spark.mllib.linalg.{DenseVector, Vector}
import org.apache.spark.rdd.RDD
import org.apache.spark.sql.SparkSession

object KMeansRDDRunner {

  def main(args: Array[String]): Unit = {
    val sparkConf = new SparkConf().set("spark.eventLog.enabled", "true")
    implicit val sparkSession: SparkSession = SparkSession.builder().config(sparkConf).getOrCreate()
    sparkSession.sparkContext.setLogLevel("WARN")

    try {
      val analytic = new KMeansRDDRunner
      val data = readData(args(0))
      //The print of the count below forces the whole job to run.
      val model = analytic.run(data)
      model.clusterCenters.foreach(println)
    } finally {
      sparkSession.stop()
    }
  }

  def readData(dataLoc: String)(implicit sparkSession: SparkSession)= {
    sparkSession.sparkContext.textFile(dataLoc)
  }
}

class KMeansRDDRunner {
  def run(rawData: RDD[String]) = {
    val kmeans = new KMeans().setK(10).setSeed(1L)

    val workableData = rawData.mapPartitions(iter => iter.map(s => {
        val key = s.split(",")
        new DenseVector(
          Array(key(3).toDouble,
            key(5).toDouble,
            key(7).toDouble,
            key(9).toDouble,
            key(11).toDouble,
            key(13).toDouble,
            key(15).toDouble,
            key(20).toDouble)).asInstanceOf[Vector]
      })).cache()

    kmeans.run(workableData)
  }
}
