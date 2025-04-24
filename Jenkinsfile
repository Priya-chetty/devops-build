pipeline {
    agent any

    environment {
        DOCKER_DEV_REPO = 'priya2223/dev'
        DOCKER_PROD_REPO = 'priya2223/prod'
        DOCKER_CREDS = 'dockerhub-creds'
    }

    stages {
        stage('Clone Repo') {
            steps {
                git branch: env.BRANCH_NAME, url: 'https://github.com/Priya-chetty/devops-build.git'
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
                    dockerImage = docker.build("${env.BRANCH_NAME == 'master' ? DOCKER_PROD_REPO : DOCKER_DEV_REPO}:${env.BUILD_ID}")
                    def tag = (env.BRANCH_NAME == 'master') ? 'prod' : 'dev'
                    sh "docker build -t ${IMAGE_NAME}:${tag} ."
                }
            }
        }

        stage('Push to DockerHub') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', DOCKER_CREDS) {
                        dockerImage.push()
                    }
                }
            }
        }

        stage('Deploy Container') {
            steps {
                sh '''
                docker rm -f myapp || true
                docker run -d -p 3000:3000 --name myapp ${BRANCH_NAME == 'master' ? DOCKER_PROD_REPO : DOCKER_DEV_REPO}:${BUILD_ID}
                '''
            }
        }
    }
}
=======
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

>>>>>>> 46aa63b (Add Jenkinsfile for CI/CD pipeline)
