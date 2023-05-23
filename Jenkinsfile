pipeline {
  agent any
  options {
    buildDiscarder(logRotator(numToKeepStr: '35'))
  }
  environment {
    DOCKERHUB_CREDENTIALS = credentials('dockerhub')
  }
  stages {
  
   stage('PreCondition') {
            agent {
                docker {
                    image 'maven:3.6.3'
		    args '-v $HOME/.m2:/root/.m2'
                    // Run the container on the node specified at the
                    // top-level of the Pipeline, in the same workspace,
                    // rather than on a new node entirely:
                    reuseNode true
			 }
			}
		}  
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
		 
		 
