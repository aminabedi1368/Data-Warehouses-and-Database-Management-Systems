from pyspark.sql import SparkSession
from pyspark.sql.functions import col, sum, count, avg

# Create a Spark session
spark = SparkSession.builder \
    .appName("RealEstateQueries") \
    .config("spark.cassandra.connection.host", "cassandra") \
    .config("spark.cassandra.connection.port", "9042") \
    .getOrCreate()

# Read the data from Cassandra
property_df = spark.read \
    .format("org.apache.spark.sql.cassandra") \
    .options(table="property", keyspace="realestate") \
    .load()

transaction_df = spark.read \
    .format("org.apache.spark.sql.cassandra") \
    .options(table="transaction", keyspace="realestate") \
    .load()

# 1. Total Revenue by Property Type
total_revenue_by_property_type = property_df \
    .join(transaction_df, "property_id") \
    .filter(transaction_df.transaction_type == "Sale") \
    .groupBy("property_type") \
    .agg(sum("transaction_amount").alias("total_revenue"))

total_revenue_by_property_type.show()

# 2. Top 5 Most Expensive Properties
top_5_expensive_properties = property_df \
    .orderBy(col("price").desc()) \
    .limit(5)

top_5_expensive_properties.show()

# 3. Clients Who Have Made More Than One Transaction
client_transactions = transaction_df \
    .groupBy("client_id") \
    .agg(count("*").alias("number_of_transactions")) \
    .filter(col("number_of_transactions") > 1)

client_transactions.show()

# Add more queries as needed...

# Stop the Spark session
spark.stop()
