
# Real Estate Query Application with Spark, Cassandra, and MySQL

This project is a Node.js-based web application that integrates with **Apache Spark**, **Cassandra**, and **MySQL** to execute and display SQL and CQL queries for a real estate dataset. It uses **Express.js** for the backend, **Axios** for making API calls, and supports dynamic query execution with **EJS** templates for rendering results.

## Features

- Execute SQL queries using **Spark SQL REST API** and display the results in JSON format.
- Perform **Cassandra** CQL queries and render the results using an **EJS**-based frontend.
- Run Spark jobs via **Docker** and process output results.
- Execute MySQL queries and render results using **EJS**.
- Organize queries into different directories for flexible execution.

## Technologies

- **Node.js**: Backend framework for the API and web application.
- **Express.js**: Routing and middleware management.
- **Apache Spark**: For executing distributed queries, integrated with Cassandra using Spark-Cassandra connector.
- **Cassandra**: NoSQL database for scalable real estate data storage.
- **MySQL**: Relational database for structured data management.
- **Docker**: Containerization for Spark, Cassandra, and MySQL services.
- **Axios**: HTTP client for making requests to the Spark SQL REST API.
- **EJS**: Template engine for rendering results on the frontend.

## Project Structure

```bash
.
├── app.js                   # Main Node.js application file
├── Dockerfile               # Docker configuration for the Node.js application
├── docker-compose.yml       # Docker Compose file for setting up services
├── queries/                 # Directory containing SQL/CQL queries
│   ├── sample_query.sql     # Sample MySQL query
│   ├── sample_query.cql     # Sample Cassandra CQL query
├── views/                   # EJS templates for rendering query results
│   └── index.ejs            # Main template to display query results
└── README.md                # Project documentation
```

## Setup

### Prerequisites

Ensure that the following tools are installed on your system:

- [Node.js](https://nodejs.org/)
- [Docker](https://www.docker.com/)
- [Docker Compose](https://docs.docker.com/compose/)

### Step 1: Clone the Repository

```bash
git clone https://github.com/your-username/real-estate-query-app.git
cd real-estate-query-app
```

### Step 2: Install Node.js Dependencies

```bash
npm install
```

### Step 3: Docker Configuration

Build the Docker images for Cassandra, Spark, and MySQL services using `docker-compose.yml`.

#### Docker Compose Services:

- **Cassandra**: Configured with a custom keyspace and cluster name.
- **Spark**: Master and Worker services with the Cassandra-Spark connector.
- **MySQL**: Initialized with a real estate database and user credentials.

```bash
docker-compose up -d
```

This command will start all services defined in the `docker-compose.yml` file.

### Step 4: Build the Application Docker Image

A `Dockerfile` is provided to package the Node.js application into a container:

```bash
docker build -t real-estate-app .
```

### Step 5: Run the Application

Once the services are up and running, you can start the Node.js application:

```bash
node app.js
```

The server will be available at `http://localhost:3000`.

## API Endpoints

### 1. Execute a Specific Query

**POST** `/execute`

Executes a specific SQL or CQL query from the `queries` folder.

- **Request Body**: 
  ```json
  {
    "queryFile": "sample_query.sql"  // Or sample_query.cql
  }
  ```

- **Response**:
  Returns the result of the query in JSON format.

### 2. Execute All Queries in a Directory

**GET** `/execute-all`

Executes all queries from the `queries` directory (both `.sql` and `.cql`).

- **Response**:
  Returns an array of query results for all executed queries.

### 3. Run a Spark Job

**GET** `/run-spark-query`

Executes a predefined Spark job inside the Docker container.

- **Response**:
  Returns the result of the Spark job as JSON.

## Query Structure

Place all SQL and CQL queries inside the `queries` folder. 

- **MySQL Queries**: Files with `.sql` extension.
- **Cassandra Queries**: Files with `.cql` extension.

Example folder structure:
```
queries/
├── sample_query.sql
└── sample_query.cql
```

## Docker Services

The application uses the following Docker containers, defined in the `docker-compose.yml` file:

- **Cassandra**: Stores the real estate data and processes CQL queries.
- **Spark**: Handles Spark SQL queries and integrates with Cassandra for distributed computing.
- **MySQL**: Manages structured real estate data.
- **Node.js App**: Serves the API and web interface for query execution.

### Sample `docker-compose.yml`

```yaml
version: '3.8'

services:
  cassandra:
    image: cassandra:latest
    container_name: cassandra
    ports:
      - "9042:9042"
    environment:
      CASSANDRA_CLUSTER_NAME: "RealEstateCluster"
      CASSANDRA_KEYSPACE: "realestate"
    networks:
      - cassandra_spark_net

  spark:
    image: bitnami/spark:3.4
    container_name: spark_master
    environment:
      - SPARK_MODE=master
    ports:
      - '8080:8080'
      - '4040:4040'
    networks:
      - cassandra_spark_net

  mysql:
    image: mysql:latest
    container_name: mysql
    environment:
      MYSQL_ROOT_PASSWORD: rootpassword
      MYSQL_DATABASE: realestate
    ports:
      - "3306:3306"
    networks:
      - cassandra_spark_net

  app:
    build: .
    container_name: real_estate_app
    ports:
      - "3000:3000"
    networks:
      - cassandra_spark_net
    depends_on:
      - cassandra
      - mysql
      - spark

networks:
  cassandra_spark_net:
    driver: bridge
```

## Troubleshooting

1. **Connection Issues**:
   - Ensure that the services (Cassandra, MySQL, Spark) are running properly by checking Docker logs.
   - Verify that port mappings in `docker-compose.yml` are correct.

2. **Query Errors**:
   - If any query fails, it will be logged in the console with the file name. You can inspect the error message for further debugging.

3. **Docker Build Issues**:
   - If building the Docker image for the application fails, ensure that Node.js dependencies are installed and paths in the `Dockerfile` are correct.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

