pipeline {
    agent any
     
    stages {
        stage("Build and start test image") {
            steps {
                sh "docker-composer down"
                sh "docker-compose up -d"
            }
        }
    }
   
}
