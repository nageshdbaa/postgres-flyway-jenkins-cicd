pipeline {
  agent any

  environment {
    FLYWAY_HOME = "/opt/flyway"
    FLYWAY_CONF = "/opt/flyway/conf/flyway.conf"
    SQL_DIR     = "/opt/flyway/sql"
  }

  stages {

    stage('Checkout from GitHub') {
      steps {
        git branch: 'main',
            url: 'https://github.com/nageshdbaa/postgres-flyway-jenkins-cicd.git'
      }
    }

    stage('Sync SQL to Flyway Server') {
      steps {
        sh '''
          rm -rf ${SQL_DIR}/*
          cp -r sql/* ${SQL_DIR}/
          ls -lrt ${SQL_DIR}
        '''
      }
    }

    stage('Flyway Validate') {
      steps {
        sh '''
          ${FLYWAY_HOME}/flyway \
            -configFiles=${FLYWAY_CONF} validate
        '''
      }
    }

    stage('Flyway Info') {
      steps {
        sh '''
          ${FLYWAY_HOME}/flyway \
            -configFiles=${FLYWAY_CONF} info
        '''
      }
    }

    stage('Approve PROD Deployment') {
      steps {
        input message: 'Approve DB changes?'
      }
    }

    stage('Flyway Migrate') {
      steps {
        sh '''
          ${FLYWAY_HOME}/flyway \
            -configFiles=${FLYWAY_CONF} migrate
        '''
      }
    }
  }
}
