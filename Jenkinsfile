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
                    // Install Python and python3-venv directly in Windows
                    sh 'choco install python --version=3.10 -y' // Installing Python using Chocolatey
                    sh 'python -m ensurepip --upgrade'  // Upgrade pip
                    sh 'python -m venv venv' // Create virtual environment
                }
            }
        }

        stage('Install Dependencies') {
            steps {
                script {
                    echo "Installing dependencies..."
                    sh './venv/Scripts/pip install -r requirements.txt'  // Install Python dependencies
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
