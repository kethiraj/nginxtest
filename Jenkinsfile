pipeline {
    agent any
    
    stage("Build and start test image") {
            steps {
                sh "docker-composer build"
                sh "docker-compose up -d"
                }
        }
     
    stages {
        stage('Ok') {
            steps {
                echo "Ok"
            }
        }
    }
    post {
        always {
            emailext body: 'A Test EMail', recipientProviders: [[$class: 'DevelopersRecipientProvider'], [$class: 'RequesterRecipientProvider']], subject: 'Test'
        }
    }
}
