pipeline {
    agent any

    environment {
        DOCKER_CREDENTIALS_ID = 'dockerlogin' // Update with your Docker credentials ID in Jenkins
        GITLAB_CREDENTIALS_ID = 'gitlab' // Update with your GitLab credentials ID in Jenkins
        REGISTRY = 'charlesprakash/prod' // Update with your Docker registry (e.g., docker.io/your-username)
        IMAGE_NAME = 'php-postgres'
        CHART_PATH = './php-postgres' // Path to your Helm chart
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from the Git repository
                git 'https://gitlab.stackroute.in/Charles.prakash/Capstone-Project.git' // Update with your Git repository URL
            }
        }

        stage('Build PHP Image') {
            steps {
                script {
                    // Build the Docker image for PHP
                    docker.build("${REGISTRY}/${IMAGE_NAME}-php:latest", "-f Dockerfile.php .")
                }
            }
        }

        stage('Build Postgres Image') {
            steps {
                script {
                    // Build the Docker image for PostgreSQL
                    docker.build("${REGISTRY}/${IMAGE_NAME}-postgres:latest", "-f Dockerfile.postgres .")
                }
            }
        }

        stage('Push Images') {
            steps {
                script {
                    // Push the Docker images to the registry
                    withCredentials([usernamePassword(credentialsId: DOCKER_CREDENTIALS_ID, passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
                        sh "echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin ${REGISTRY}"
                        sh "docker push ${REGISTRY}/${IMAGE_NAME}-php:latest"
                        sh "docker push ${REGISTRY}/${IMAGE_NAME}-postgres:latest"
                    }
                }
            }
        }

        stage('Deploy Helm Chart') {
            steps {
                script {
                    // Deploy the Helm chart using the updated images
                    sh "helm upgrade --install ${IMAGE_NAME} ${CHART_PATH} --namespace my-namespace --values ${CHART_PATH}/values.yaml"
                }
            }
        }
    }

    post {
        success {
            echo 'Deployment successful!'
        }
        failure {
            echo 'Deployment failed.'
        }
    }
}
