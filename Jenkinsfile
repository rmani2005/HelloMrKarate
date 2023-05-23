pipeline {
    agent none
environment {
    DOCKERHUB_CREDENTIALS = credentials('manikandanravi9')
  }
    stages {
        stage('Build') {
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
		steps {
                //sh 'mvn clean package -Dmaven.test.skip=true'
		 }
		}
		stage('Docker Build') 
		{
			agent any
		      steps {
			sh 'docker build -t hellomrkarate-docker:latest .'
			}
   
		}
		stage('Login') {
		      steps {
		        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
		      }
		    }
		stage('Push') {
		      steps {
		        sh 'docker push manikandanravi/hellomrkarate-docker'
		      }
		    }
}
}
