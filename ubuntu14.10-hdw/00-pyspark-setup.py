import os
import sys

spark_home = os.environ.get('SPARK_HOME', None)
if not spark_home:
    raise ValueError('SPARK_HOME environment variable is not set')
sys.path.insert(0, os.path.join(spark_home, 'python'))
sys.path.insert(0, os.path.join(spark_home, 'python/lib/py4j-0.8.2.1-src.zip'))

os.environ['PYSPARK_SUBMIT_ARGS'] = '--master yarn --deploy-mode client'

try:
    from pyspark import SparkConf
    from pyspark import SparkContext

except ImportError as e:
    print ("Error importing Spark Modules", e)
    sys.exit(1)

conf=SparkConf()
conf.set("spark.executor.memory", "1g")
conf.set("spark.cores.max", "1")
conf.setAppName("iPython Notebook")
sc = SparkContext(conf=conf)
