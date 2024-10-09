# Dockerfile for Cassandra
FROM cassandra:latest

# Set environment variables for Cassandra setup
ENV CASSANDRA_CLUSTER_NAME="RealEstateCluster"
ENV CASSANDRA_KEYSPACE="realestate"

# Copy initialization scripts
COPY ./cassandra-schema.cql /docker-entrypoint-initdb.d/
COPY ./insert_dummy_data.cql /docker-entrypoint-initdb.d/

# Expose ports for Cassandra
EXPOSE 9042 7000 7001 7199 9160

