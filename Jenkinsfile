#!Groovy

pipeline
{
agent none

stages {
	stage('Precondition-Maven Install')
		{
		steps{
			agent
			{
				docker
				 { 
				image 'maven:3.6.3'
				}
			}
		}
		}
		steps
		{
			sh 'mvn clean install'
		}
	}
}

