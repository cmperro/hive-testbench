from pyspark.sql import SparkSession
import sys


if __name__ == '__main__':
    query = sys.argv[1]
    db = sys.argv[2]
    location = "hdfs:///tmp/spark-queries-tpcds/q" + query + ".sql"
    app_name = "TPCDS APP DH - QUERY " + query
    spark = SparkSession \
    .builder \
    .appName(app_name) \
    .getOrCreate()
    use_query="use " + db + ";"
    spark.sql(use_query)
    df3 = spark.read.text(location, wholetext=True)
    query2=df3.collect()[0][0]
    results = spark.sql(query2).show()