pipeline {
    agent any

    environment {
        CHART_PATH = '.'                   // Path to Helm chart (root level)
        NAMESPACE = 'group3Project'        // Kubernetes namespace
    }

    stages {
        stage('Checkout') {
            steps {
                script {
                    checkout([$class: 'GitSCM', 
                        branches: [[name: '*/main']], // Adjust this if you're using a different branch
                        userRemoteConfigs: [[url: 'https://github.com/charlesprakash-git/Capstone-Project.git']]
                    ])
                }
            }
        }

        stage('Lint Helm Chart') {
            steps {
                script {
                    // Lint the Helm chart to catch any issues
                    sh "helm lint ${CHART_PATH}"
                }
            }
        }

        stage('Deploy Helm Chart') {
            steps {
                script {
                    // Deploy the Helm chart using the dependencies from the templates folder
                    sh "helm upgrade --install php-postgres ${CHART_PATH} --namespace ${NAMESPACE} --values ${CHART_PATH}/values.yaml --wait --timeout 300s"
                }
            }
        }

        stage('Verify Deployment') {
            steps {
                script {
                    // Verify that the deployment is successful by checking the pod status
                    sh "kubectl get pods --namespace ${NAMESPACE} -l app=php-postgres"
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
