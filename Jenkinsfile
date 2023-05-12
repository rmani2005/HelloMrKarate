#!Groovy

pipeline
{
agent none

stages {
	stage('Precondition-Maven Install')
		{
			agent
			{
				docker
				 { 
				image 'maven:3.6.3'
				}
			}
		}
		stage('Mvn Clean')
		{
			sh 'mvn clean install'
		}
	}
}

