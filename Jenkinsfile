pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'echo "Hello World"'
                sh '''
                    sed -i -e 's/variable1/'${Title}'/g' index.html
                    sed -i -e 's/variable2/BuildNumber is '${Buildnumber}'/g' index.html
                    sed -i -e 's/variable3/ProjectName is '${jobName}'/g' index.html
                    docker-compose down
                    docker-compose rm -f
                    docker rmi --force $(docker images -a -q)
                    docker build -t ethiraj_web .
                    docker-compose up -d
                '''
            }
        }
    }
    post {
        always {
            emailext body: "${currentBuild.currentResult}: Job ${env.JOB_NAME} build ${env.BUILD_NUMBER}\n More info at: ${env.BUILD_URL}",
                recipientProviders: [[$class: 'DevelopersRecipientProvider'], [$class: 'RequesterRecipientProvider']],
                subject: Jenkins Build ${currentBuild.currentResult}: Job ${env.JOB_NAME}
        }
    }
}
