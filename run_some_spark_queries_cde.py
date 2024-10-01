from pyspark.sql import SparkSession
import sys
import random
import configparser



config = configparser.ConfigParser()
config.read('/app/mount/parameters.conf')
#storageLocation=config.get("general","data_lake_bucket")
storageLocation=sys.argv[2]
#storagePath=config.get("general","path_to_spark_queries")
storagePath=sys.argv[3]
print("Storage Location from Config File: ", storageLocation)
print("Path to Queries from Config File: ", storagePath)
#query = sys.argv[1]
db = sys.argv[1]
query = str(random.randint(1,100))
print("Running Query ", query)
location = "s3a://" +  storageLocation + "/" + storagePath +  "q" + query + ".sql"
app_name = "TPCDS APP CDE - QUERY " + query
spark = SparkSession \
    .builder \
    .appName(app_name) \
    .getOrCreate()
use_query="use " + db + ";"
spark.sql(use_query)
df3 = spark.read.text(location, wholetext=True)
query2=df3.collect()[0][0]
results = spark.sql(query2).show()