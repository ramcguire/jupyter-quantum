def img
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
        img = docker.build("${DOCKER_CREDS_USR}/jupyter-quantum")
      }
    }

    stage ('Test image') {
      steps {
        img.inside {
          sh 'echo "If this runs, tests pass"'
        }
      }
    }

    stage ('Push image') {
      steps {
        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
          img.push("latest")
        }
      }
    }
      
  }
}