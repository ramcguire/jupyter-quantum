pipeline {
  agent any
  environment {
    DOCKER_CREDS = credentials('docker-hub-credentials')
  }
  stages {
    stage ('Get most recent version from git') {
      steps {
        checkout scm
      }
    }
    stage ('Build image') {
      steps {
        sh "docker build -t ${DOCKER_CREDS_USR}/jupyter-quantum ."
      }
    }

    stage ('Push image') {
      steps {
        sh "docker push ${DOCKER_CREDS_USR}/jupyter-quantum"
      }
    }
  }
}