pipeline {
  options {
    buildDiscarder(logRotator(numToKeepStr: '35'))
  }
  environment {
    DOCKERHUB_CREDENTIALS = credentials('dockerhub')
  }
  agent {
         docker {
            image 'maven:3.6.3'
		 }
   } 
  stages {
    stage('Build') {
      steps {
        sh 'docker build -t manikandanravi9/hellomrkarate-docker:latest .'
      }
    }
    stage('Login') {
      steps {
        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
      }
    }
    stage('Push') {
      steps {
        sh 'docker push manikandanravi9/hellomrkarate-docker'
      }
    }
  }
  post {
    always {
      sh 'docker logout'
    }
  }
}
		 
		 
