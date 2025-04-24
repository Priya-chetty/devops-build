pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-creds')
        IMAGE_NAME = "priya-chetty/devops-build"
    }

    triggers {
        pollSCM('* * * * *')  // Optional: Use GitHub webhook instead
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: "${env.BRANCH_NAME}", url: 'https://github.com/Priya-chetty/devops-build.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    def tag = (env.BRANCH_NAME == 'master') ? 'prod' : 'dev'
                    sh "docker build -t $IMAGE_NAME:$tag ."
                }
            }
        }

        stage('Push to DockerHub') {
            steps {
                script {
                    def tag = (env.BRANCH_NAME == 'master') ? 'prod' : 'dev'
                    sh """
                        echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin
                        docker push $IMAGE_NAME:$tag
                    """
                }
            }
        }

        stage('Deploy') {
            steps {
                echo "Would deploy to environment for ${env.BRANCH_NAME} branch"
                // Add kubectl or docker run logic here
            }
        }
    }
}
