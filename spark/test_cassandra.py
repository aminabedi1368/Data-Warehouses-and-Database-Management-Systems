# read_cassandra.py
from pyspark.sql import SparkSession

# Create Spark session with Cassandra support
spark = SparkSession.builder \
    .appName("SparkCassandraTest") \
    .config("spark.cassandra.connection.host", "cassandra") \
    .config("spark.cassandra.connection.port", "9042") \
    .getOrCreate()

# Read data from Cassandra (replace keyspace_name and table_name with your actual keyspace and table)
df = spark.read \
    .format("org.apache.spark.sql.cassandra") \
    .options(table="property", keyspace="realestate") \
    .load()

# Show the data from Cassandra
df.show()

# Stop the Spark session
spark.stop()
