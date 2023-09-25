pipeline 
{
    agent any
    tool { 
        maven 'maven 3.3.9' 
        jdk 'jdk17' 
    }
    stages
    {
        stage ('Initialize the Maven')
        {
            steps {
                sh '''
                    echo "PATH = ${PATH}"
                    echo "M2_HOME = ${M2_HOME}"
                ''' 
            }
        }
        stage ('Build the maven project with testing parameter') 
        {
            steps 
            {
                //env.environment
                //env.module
                //env.exeType
                //env.
                sh 'mvn clean test' 
            }
            post 
            {
                success 
                {
                    junit 'target/surefire-reports/**/*.xml' 
                }
            }
        }
        
    }
}