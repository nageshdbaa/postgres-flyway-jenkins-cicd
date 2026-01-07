pipeline {
    agent any

    environment {
        FLYWAY_HOME = "/opt/flyway"
        FLYWAY_CONF = "/opt/flyway/conf/flyway.conf"
    }

    stages {

        stage('Sync SQL to Flyway Server') {
            steps {
                sh '''
                rm -f /opt/flyway/sql/*.sql
                cp -v sql/*.sql /opt/flyway/sql/
                '''
            }
        }

        stage('Flyway Info (Before)') {
            steps {
                sh '''
                ${FLYWAY_HOME}/flyway -configFiles=${FLYWAY_CONF} info
                '''
            }
        }

        stage('Flyway Migrate') {
            steps {
                sh '''
                ${FLYWAY_HOME}/flyway -configFiles=${FLYWAY_CONF} migrate
                '''
            }
        }

        stage('Flyway Validate (After)') {
            steps {
                sh '''
                ${FLYWAY_HOME}/flyway -configFiles=${FLYWAY_CONF} validate
                '''
            }
        }
    }
}
