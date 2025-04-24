pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-creds') // Replace with Jenkins Credentials ID
        IMAGE_NAME = 'priya2223/my-devops-app'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: "${env.BRANCH_NAME}", url: 'https://github.com/sriram-R-krishnan/devops-build.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    def tag = (env.BRANCH_NAME == 'master') ? 'prod' : 'dev'
                    sh "docker build -t ${IMAGE_NAME}:${tag} ."
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    def tag = (env.BRANCH_NAME == 'master') ? 'prod' : 'dev'
                    sh "echo ${DOCKERHUB_CREDENTIALS_PSW} | docker login -u ${DOCKERHUB_CREDENTIALS_USR} --password-stdin"
                    sh "docker push ${IMAGE_NAME}:${tag}"
                }
            }
        }
    }

    post {
        failure {
            echo "Build failed!"
        }
        success {
            echo "Build and push successful!"
        }
    }
}

