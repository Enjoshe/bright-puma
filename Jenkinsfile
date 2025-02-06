pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Install python3-venv') {
            steps {
                script {
                    // Install python3-venv package for virtual environment creation
                    echo "Installing python3-venv..."
                    sh 'sudo apt-get update && sudo apt-get install -y python3-venv'
                }
            }
        }

        stage('Install Dependencies') {
            steps {
                script {
                    // Create virtual environment
                    echo "Creating virtual environment..."
                    sh 'python3 -m venv venv'
                    sh './venv/bin/pip install -r requirements.txt'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    echo "Building Docker Image..."
                    sh 'docker build -t bright-puma .'
                }
            }
        }

        stage('Deploy') {
            steps {
                echo "Deploying..."
            }
        }

        stage('Health Check') {
            steps {
                echo "Checking health..."
            }
        }

        stage('Run Tests') {
            steps {
                echo "Running Tests..."
            }
        }
    }

    post {
        always {
            echo "Cleaning up workspace..."
            cleanWs()
        }
    }
}
