//K-Mean --> Start
import org.apache.spark.mllib.clustering.{KMeans, KMeansModel}
import org.apache.spark.mllib.linalg.Vectors
val data = sc.textFile("hdfs:///user/hortonworks/test.csv")
val parsedData = data.map(s => Vectors.dense(s.split(',').map(_.toDouble))).cache()
val numClusters = 5
val numIterations = 10
val numRuns = 3
val clusters = KMeans.train(parsedData, numClusters, numIterations, numRuns)
val WSSSE = clusters.computeCost(parsedData)
println("Within Set Sum of Squared Errors = " + WSSSE)
clusters.save(sc, "myModelPath")
val sameModel = KMeansModel.load(sc, "myModelPath")
//K-Mean --> End

//Gaussian --> Start
import org.apache.spark.mllib.clustering.GaussianMixture
import org.apache.spark.mllib.clustering.GaussianMixtureModel
import org.apache.spark.mllib.linalg.Vectors
val data = sc.textFile("hdfs:///user/hortonworks/test.csv")
val parsedData = data.map(s => Vectors.dense(s.trim.split(',').map(_.toDouble))).cache()
val gmm = new GaussianMixture().setK(2).run(parsedData)
gmm.save(sc, "myGMMModel")
val sameModel = GaussianMixtureModel.load(sc, "myGMMModel")
for (i <- 0 until gmm.k) {
  println("weight=%f\nmu=%s\nsigma=\n%s\n" format
    (gmm.weights(i), gmm.gaussians(i).mu, gmm.gaussians(i).sigma))
}
//Gaussian --> End

//Power Iteration --> Start
import org.apache.spark.mllib.clustering.{PowerIterationClustering, PowerIterationClusteringModel}
import org.apache.spark.mllib.linalg.Vectors
val data = sc.textFile("hdfs:///user/hortonworks/test.csv)
val similarities = data.map { line =>
  val parts = line.split(' ')
  (parts(0).toLong, parts(1).toLong, parts(2).toDouble)
}
val pic = new PowerIterationClustering()
  .setK(2)
  .setMaxIterations(10)
val model = pic.run(similarities)
model.assignments.foreach { a => println(s"${a.id} -> ${a.cluster}") }
model.save(sc, "myModelPath")
val sameModel = PowerIterationClusteringModel.load(sc, "myModelPath")
//Power Interation --> End



****
import org.apache.spark.mllib.clustering.{KMeans, KMeansModel}
import org.apache.spark.mllib.linalg.Vectors

// Load and parse the data
val data = sc.textFile("hdfs:///user/hortonworks/test.csv")
val parsedData = data.map(s => Vectors.dense(s.split(',').map(_.toDouble))).cache()

// Cluster the data into two classes using KMeans
val numClusters = 2
val numIterations = 20
val clusters = KMeans.train(parsedData, numClusters, numIterations)

// Evaluate clustering by computing Within Set Sum of Squared Errors
val WSSSE = clusters.computeCost(parsedData)
println("Within Set Sum of Squared Errors = " + WSSSE)

// Save and load model
clusters.save(sc, "hdfs:///user/hortonworks/Cluster_GPA_model")
//val sameModel = KMeansModel.load(sc, "hdfs:///user/hortonworks/Cluster_GPA_model")
