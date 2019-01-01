# Development Guideline

> The intention of this document is to give an overview how the api is structured and how it works.

The project was developed with IntelliJ IDEA and contains configurations for most Maven tasks.

### Maven Setup 

Clean and create the api artifact

IntelliJ:

```
api[build](development)
api[build](release)
```

Maven:

```
mvn clean install -Pdevelopment
mvn clean install -Prelease
```

Clean, build and deploy the api artifact to Tomcat Server

IntelliJ:

```
api[deploy](development)
api[redeploy](development)
api[undeploy](development)

```

Maven:

```
mvn clean install
```

```
mvn clean tomcat7:deploy
mvn clean tomcat7:redeploy

```

Undeploy the artifact from Tomcat Server

```
mvn clean tomcat7:undeploy
```

**Note:** For the deployment to tomcat the appropriate credentials need to be setup. This might require to modify your `.m2/settings.xml`.

## Docker Setup

This project contains `docker-compose` files to assist with providing a database for api-backend.

IntelliJ:

```
wcalc-docker(development)
wcalc-docker(release)
```

The difference between development and release ist that the development deployment is exposing all of the ports to the outside.
This allows for manual setup of the database instead of having to move the database files onto the docker container and setting up the database from there.

## Quality of Code

### Checkstyle

Checkstyle is used to enforce a certain style and level of quality. To run and check all files use the maven checkstyle plugin.


IntelliJ:

```
api[checkstyle]
```

Maven:

```
mvn checkstyle:checkstyle
```

### PMD

PMD is an open source static source code analyzer that report on issues found within application code.

IntelliJ:

```
api[pmd]
```

Maven:

```
mvn pmd:pmd
```

## Architecture

### Persistence

Because this World of Warcraft calculator is supporting three different versions of WoW three separate databases are used.
Those databases are defined as three separate persistence unit inside `persistence.xml`. The content of those databases
are contained in separate maven modules.

| Module           | Description                                              |
| ---------------- |--------------------------------------------------------- |
| classic-dbscript | Database module for the Classic World of Warcraft Game   |
| bc-dbscript      | Database module for the expansion Burning Crusade        |
| wotlk-dbscript   | Database module for the expansion Wrath of The Lich King |

**Note:** It is important that the database is setup completely and reachable before the api-backend is starting up. During the
startup the `EntityManagerUtility` classs statically sets up everything for hibernate to connect to the databases. If this does not
work the api-backend can only recover from this with a restart of the application.

### Caching

The World of Warcraft Talentcalculator is heavily caching outputs from the backend and data from the database because the
content is static and does not change.

#### Database Caching

Each persistence units has its own Eh-cache manager and therefore its own cache. While the api is in debug mode it is
possible to attach remotely via jms bridge to the server and inspect those caches. The entities are using a read only cache named `wcalc_cache`.

#### Browser Caching

Successful api requests contain a caching header to prevent repeating hits on the backend.

`Cache-Control: max-age=3600`

### API endpoints

**/klass**

Main entrypoint to retrieve all data related to all klasses

```json
{
  "type": "array",
  "items": {
    "type": "object",
    "required": [
      "id",
      "klassName"
    ],
    "properties": {
      "id": {
        "type": "integer"
      },
      "klassName": {
        "type": "string"
      }
    }
  }
}
```

See `/src/test/resources/schemas/klass_schema.json` for a detailed json schema specification

**/klass/{id}**

Main entrypoint to retrieve all data related to a specific single klass

```json
{
  "type": "object",
  "required": [
    "id",
    "klassName"
  ],
  "properties": {
    "id": {
      "type": "integer"
    },
    "klassName": {
      "type": "string"
    }
  }
}
```

**/tree**

Entrypoint to retrieve all treedata for all klasses. A klass has exactly three trees.

```json
{
  "type": "array",
  "items": {
    "type": "object",
    "required": [
      "id",
      "treeName",
      "treePos"
    ],
    "properties": {
      "id": {
        "type": "integer"
      },
      "treeName": {
        "type": "string"
      },
      "treePos": {
        "type": "integer"
      }
    }
  }
}
```

**/tree/{id}**

Entrypoint to retrieve a specific tree by its id

```json
{
  "type": "object",
  "required": [
    "id",
    "treeName",
    "treePos"
  ],
  "properties": {
    "id": {
      "type": "integer"
    },
    "treeName": {
      "type": "string"
    },
    "treePos": {
      "type": "integer"
    }
  }
}
```
