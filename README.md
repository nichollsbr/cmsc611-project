# cmsc611-project
Data from: https://www.kaggle.com/noaa/noaa-global-surface-summary-of-the-day 
(Just get the file from the shared drive)

Download spark 2.1.0 Pre-Built for Hadoop 2.7 and later from http://spark.apache.org/downloads.html
Move the download .tgz file to some directory (like ~/spark/) then run:
tar -xvzf spark-2.1.0-bin-hadoop2.7.tgz

Then put the bin directory inside of the unpackaged spark directory on your PATH.
In mac, this can be done by putting the following line in ~/.bash_profile
In ubuntu 16.04, put the following line at the end of ~/.bashrc
```
export PATH=$PATH:/path/to/spark/directory/bin
```

You'll know this is done right, after restarting your command line, you can tab complete the spark-submit command.
Or just type spark-submit into your command line terminal and make sure it prints out the long list of options.

This might be helpful for Windows users:
https://www.ics.uci.edu/~shantas/Install_Spark_on_Windows10.pdf
https://dzone.com/articles/working-on-apache-spark-on-windows

You'll need to download the gsod_csv.zip from the shared directory.
Put that in the data/ directory, cd data (i.e. be in the data directory), and run the unpack_noaa.sh script.
```bash
cd data
./unpack_noaa.sh
```

You also want to
```bash
mkdir /tmp/spark-dir/
```
We can change the directory if that's an issue for windows.

You'll also need:
* Git (I recommend using a UI.  Though I've never used it on Windows, might I recommend Fork: https://git-fork.com/) 
* Maven (any version after like 3.4.*, but I'm on 3.5.3).
  * If on linux, you do NOT want to install using apt-get. Follow instructions below
  * If on Mac, install using brew (or follow instructions below)
  * Follow the first 3 steps of: https://www.javahelps.com/2017/10/install-apache-maven-on-linux.html
  * At the end of ~/.bashrc, append the following two lines
  ```bash
  export M2_HOME=/path/to/maven #(probably /opt/apache-maven-3.6.0)
  export PATH=$M2_HOME/bin:$PATH
  ```
* Java (I'm on 1.8.0_172)
* Scala (I'm on 2.11.12)
* Somewhere to write your code.  I'm in love with Intellij - just use the free community version.  You'll want the scala plugin, but they've started recommending that during new installs.

# Running
First, switch to data directory unpack_noaa.sh after downloading gsod_csv.zip from the shared directory and putting it in data.

Then switch back to the cmsc611-project directory and make the spark-stats directory.
```bash
mkdir spark-stats
```

To build the relevant jar, run Maven (the mvn command) using the build.sh script or run:
```bash
mvn -DskipTests=true clean install
```

in the parent directory (cmsc611-project).  If maven becomes too much of a pain, we can just commit the jar to the git repo.
This should create a target directory in the children directories.  For instance, basic-rdd/target/ should exist.  Note this target directory will NOT be there if the mvn clean install command did not work.

To run the job locally on your machine, take a look at the relevant run.sh file in the analytic folder.
For instance, basic-rdd/run.sh.  Here's some info about how the spark-submit command works: https://spark.apache.org/docs/2.1.0/submitting-applications.html#launching-applications-with-spark-submit

To run all of the jobs, run run_all.sh in the main directory.

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
You'll need to create /tmp/spark-events.  Need to double check what to do for Windows.  For some reason, my mac deleted this at one point, not sure why.

https://jaceklaskowski.gitbooks.io/mastering-apache-spark/spark-history-server.html
go to $SPARK_HOME/sbin/start-history-server.sh

http://localhost:18080

# Useful Stuff
https://jaceklaskowski.gitbooks.io/mastering-apache-spark/spark-history-server.html
