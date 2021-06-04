pipeline {
    agent any
    stages {
        stage('Checkout') {
      steps {
        script {
           git branch: main url: 'https://github.com/kethiraj/nginxtest.git'
          }
       }
    }
        stage('Build') {
            steps {
                sh 'echo "Hello World"'
                sh '''
                    sed -i -e 's/variable1/'${Title}'/g' index.html
                    sed -i -e 's/variable2/'${Buildnumber}'/g' index.html
                    sed -i -e 's/variable3/'${jobName}'/g' index.html
                    docker-compose down
                    docker rmi --force $(docker images -a -q)
                    docker build -t ethiraj_web .
                    docker-compose up -d
                '''
            }
        }
    }
}
