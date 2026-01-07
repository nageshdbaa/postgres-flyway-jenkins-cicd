pipeline {
  agent any

  environment {
    FLYWAY_HOME = "/opt/flyway"
    FLYWAY_CONF = "/opt/flyway/conf/flyway.conf"
    SQL_DIR     = "/opt/flyway/sql"
  }

  stages {

    stage('Sync SQL to Flyway Server') {
      steps {
        sh '''
          rm -f ${SQL_DIR}/V1__*.sql ${SQL_DIR}/V2__*.sql || true
          cp -v sql/*.sql ${SQL_DIR}/
        '''
      }
    }

    stage('Flyway Validate') {
      steps {
        sh '${FLYWAY_HOME}/flyway -configFiles=${FLYWAY_CONF} validate'
      }
    }

    stage('Flyway Info') {
      steps {
        sh '${FLYWAY_HOME}/flyway -configFiles=${FLYWAY_CONF} info'
      }
    }

    stage('Approve PROD Deployment') {
      steps {
        input message: 'Approve database deployment?'
      }
    }

    stage('Flyway Migrate') {
      steps {
        sh '${FLYWAY_HOME}/flyway -configFiles=${FLYWAY_CONF} migrate'
      }
    }
  }
}
