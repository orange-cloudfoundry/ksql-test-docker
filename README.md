# ksql-test-docker
Docker image that provides tools to generate a sample of data for testing ksql

### Generic tools
 * `jq` - JSON processing tool (https://stedolan.github.io/jq/)
 * Kcat - kcat is a generic non-JVM producer and consumer for Apache Kafka (https://github.com/edenhill/kcat)
 
 ## How to get it or build it

### How to get it
Pull the image from github container registry:  
<code>docker docker pull ghcr.io/orange-cloudfoundry/ksql-test-docker:<image_tag></code>

### How to build it
Clone the repository:  
<code>https://github.com/orange-cloudfoundry/ksql-test-docker.git</code>

Then, build the image:  
<code>docker build -t ksql-test-docker:<image_tag> .</code>

## How to use it

see : https://docs.ksqldb.io/en/latest/operate-and-deploy/installation/install-ksqldb-with-docker/

`docker run -e KSQL_KSQL_QUERIES_FILE=<path-in-container-to-sql-file> ksql-test-docker:<image_tag>`
