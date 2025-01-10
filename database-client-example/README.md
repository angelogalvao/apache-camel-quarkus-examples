# Database Client Example

This project is an example of use Camel SQL component to access a MySQL database on Openshift 

## Creating the project on Openshift

1. Create the Openshift project:

```bash
oc new-project database-client-example
```

## Creating MySQL database

1. Create the database:
```bash
oc new-app mysql --name database --env MYSQL_DATABASE=exampledb --env MYSQL_USER=user01 --env MYSQL_PASSWORD=passwd --env MYSQL_ROOT_PASSWORD=passwd --env MYSQL_BINLOG_FORMAT=row
```

2. Create the nodeport for external access (optional):
```bash
oc create -f src/main/openshift/001-nodeport.yaml
```

3. Copy the database initiazion files to the database container:
```bash
oc rsync src/main/data <database-pod>:/tmp
```

4. Import the test data to the database:
```bash
oc exec <database-pod> -- /bin/sh -c 'mysql -u root < /tmp/data/database.sql'
oc exec <database-pod> -- /bin/sh -c 'mysql -u root < /tmp/data/data.sql'
```

### Deploy the Camel on Quarkus Application

1. Deploy the application on Openshift:

```bash
./mvnw install -Dquarkus.openshift.deploy=true -Dquarkus.profile=prod -Dquarkus.log.category.\"org.apache.camel.component.sql\".min-level=TRACE
```

### Deploy the Camel on Quarkus Application on Native Mode  

1. Deploy the application on Openshift on Native mode:

```bash
./mvnw install -Dquarkus.openshift.deploy=true -Dquarkus.profile=prod -Dnative -Dquarkus.native.container-build=true
```