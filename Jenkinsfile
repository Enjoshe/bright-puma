pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building the application...'
                script {
                    sh 'docker build -t bright-puma .'
                }
            }
        }

        stage('Test') {
            steps {
                echo 'Running tests...'
                script {
                    sh 'docker run --rm bright-puma python -m unittest discover tests'
                }
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying the application...'
                script {
                    sh 'docker run -d -p 5000:5000 bright-puma'
                }
            }
        }

        stage('Run') {
            steps {
                echo 'Running application...'
                script {
                    sh 'curl http://localhost:5000/check/system/operation'
                }
            }
        }
    }
}
