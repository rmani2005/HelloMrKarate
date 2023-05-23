pipeline {
    agent none
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
                sh 'mvn clean package -Dmaven.test.skip=true'
		 }
		}
		stage('Docker Build') 
		{
			agent any
		      steps {
			sh 'docker build -t hellomrkarate-docker:latest .'
			}
   
    		}
}
}
