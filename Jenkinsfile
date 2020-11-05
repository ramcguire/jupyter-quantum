pipeline {
  agent any
  def img
  environment {
    DOCKER_CREDS = credentials('docker-hub-credentials')
  }
  stages {
    stage ('Get most recent version from git') {
      checkout scm
    }

    stage ('Build image') {
      img = docker.build("${DOCKER_CREDS_USR}/jupyter-quantum")
    }

    stage ('Test image') {
      img.inside {
        sh 'echo "If this runs, tests pass"'
      }
    }

    stage ('Push image')
    docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
      img.push("latest")
    }
  }
}