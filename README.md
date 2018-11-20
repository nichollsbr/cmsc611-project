# cmsc611-project
Data from: https://www.kaggle.com/noaa/noaa-global-surface-summary-of-the-day? 
(Just get the file from the shared drive)

Download spark 2.1.0 Pre-Built for Hadoop 2.7 and later from http://spark.apache.org/downloads.html
Move the download .tgz file to some directory (like ~/spark/) then run:
tar -xvzf spark-2.1.0-bin-hadoop2.7.tgz

Then put the bin directory inside of the unpackaged spark directory on your PATH.
In mac, this can be done by putting the following line in ~/.bash_profile
export PATH=$PATH:/path/to/spark/directory/bin

You'll know this is done right, after restarting your command line, you can tab complete the spark-submit command.

This might be helpful for Windows users:
https://www.ics.uci.edu/~shantas/Install_Spark_on_Windows10.pdf
https://dzone.com/articles/working-on-apache-spark-on-windows

You'll need to download the noaa-global-surface-summary-of-the-day.zip from the shared directory.
Put that in the data/ directory and follow the unpack_noaa instructions.

For now, move the data/noaa/gsod-all/gsod_2018.tar to data/test-gsod (you'll need to create that directory)
Then cd to test-gsod and run:
tar -xvzf gsod_2018.tar
rm gsod_2018.tar

You also want to 
mkdir /tmp/spark-dir/
We can change the directory if that's an issue for windows.

You'll also need:
Maven (any version, but I'm on 3.5.3)
Java (I'm on 1.8.0_172)
Scala (I'm on 2.11.12)

# Running
To run the job locally on your machine, take a look at the relevant run.sh file in the analytic folder.
For instance, basic-rdd/run.sh

You'll see that it will set up each spark app name so that it matches the output file for the metrics.

The following pages are helpful to understand the metrics configuration:
https://github.com/LucaCanali/sparkMeasure/blob/master/docs/Flight_recorder_mode.md

Note the problem with the flight recorder mode is that it doesn't seem to stop the sparksession.
We should explore putting the metrics in the runner, or modifying the code for the sparkMeasure job.

https://github.com/LucaCanali/sparkMeasure/blob/master/examples/SparkTaskMetricsAnalysisExample.ipynb

The authors pages:

https://externaltable.blogspot.com/2017/03/on-measuring-apache-spark-workload.html

https://db-blog.web.cern.ch/blog/luca-canali/2017-03-measuring-apache-spark-workload-metrics-performance-troubleshooting

# Spark UI for Active Job
http://localhost:4040

If it's not there, that's because the port is already taken, probably by a job improperly closed.  See spark UI output.


# To Start History Server
https://jaceklaskowski.gitbooks.io/mastering-apache-spark/spark-history-server.html
go to $SPARK_HOME/sbin/start-history-server.sh

http://localhost:18080

# Useful Stuff
https://jaceklaskowski.gitbooks.io/mastering-apache-spark/spark-history-server.html
