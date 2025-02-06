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
                    echo "Installing python3-venv..."
                    // Install Python 3 and python3-venv on Linux
                    sh 'sudo apt-get update'
                    sh 'sudo apt-get install -y python3 python3-venv python3-pip'
                }
            }
        }

        stage('Install Dependencies') {
            steps {
                script {
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
