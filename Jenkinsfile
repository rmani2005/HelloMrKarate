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
                sh 'mvn clean package -Dmaven.test.skip'
           	 }
        		}
		stage('Docker Build') 
		{
			agent any
		      steps {
			sh 'docker build -t manikandanravi9/hellomrkarate-docker:latest .'
			#sh 'docker push manikandanravi9/hellomrkarate-docker:latest .'
			
			#To use the access token from your Docker CLI client:
			#1. Run docker login -u manikandanravi9
			#dckr_pat_QaOJWwb0ik9JCn2nEceHqa1tNDE
			
		      }
		    }
		    
		stage('Docker Login') 
		{
		      steps 
		      {
			DOCKERHUB_CREDENTIALS=credentials('hello-karate-dockerhub-token')
			}
			steps 
			{
				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
			}
			
			#To use the access token from your Docker CLI client:
			#1. Run docker login -u manikandanravi9
			#dckr_pat_QaOJWwb0ik9JCn2nEceHqa1tNDE
			  
		    }
		 stage('Docker Hub Push or Push to S3 bucket') 
		{
		    steps {
			
			sh 'docker PUSH manikandanravi9/hellomrkarate-dockerlatest .'
			#To use the access token from your Docker CLI client:
			#1. Run docker login -u manikandanravi9
			#dckr_pat_QaOJWwb0ik9JCn2nEceHqa1tNDE
		
		      }
		} 
		    
   
   
    }
}
