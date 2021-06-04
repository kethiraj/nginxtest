node{
    checkout scm
    stage(‘Build’) {
      sh ‘docker-compose down’ 
      sh ‘docker-compose up -d’
    }
 }
