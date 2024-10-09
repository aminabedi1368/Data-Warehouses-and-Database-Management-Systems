FROM openjdk:11-jdk

# Install Spark and Python
RUN apt-get update && \
    apt-get install -y \
    python3 \
    python3-pip \
    wget

# Install Spark
RUN wget https://archive.apache.org/dist/spark/spark-3.3.0/spark-3.3.0-bin-hadoop3.2.tgz && \
    tar xzf spark-3.3.0-bin-hadoop3.2.tgz -C /opt/ && \
    ln -s /opt/spark-3.3.0-bin-hadoop3.2 /opt/spark

# Install spark-cassandra-connector
RUN mkdir -p /opt/spark/jars && \
    wget https://repo1.maven.org/maven2/com/datastax/spark/spark-cassandra-connector_2.12/3.3.0/spark-cassandra-connector_2.12-3.3.0.jar -P /opt/spark/jars/

# Copy the PySpark script
COPY ./test_cassandra.py /opt/spark/

# Define the command to run
CMD ["/opt/spark/bin/spark-submit", "--packages", "com.datastax.spark:spark-cassandra-connector_2.12:3.3.0", "/opt/spark/test_cassandra.py"]
