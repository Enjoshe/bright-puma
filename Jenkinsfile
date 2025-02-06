pipeline {
    agent any

    environment {
        IMAGE_NAME = 'bright-puma'  // Docker image name
        CONTAINER_NAME = 'bright-puma-container'  // Docker container name
    }

    stages {
        stage('Build') {
            steps {
                echo 'Building the application...'
                script {
                    // Build the Docker image
                    sh 'docker build -t $IMAGE_NAME .'
                }
            }
        }

        stage('Test') {
            steps {
                echo 'Running tests...'
                script {
                    // Assuming you have tests in a 'tests' directory or modify accordingly
                    // Run the tests using Docker container
                    sh 'docker run --rm $IMAGE_NAME python -m unittest discover tests'
                }
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying the application...'
                script {
                    // Run the Docker container in detached mode
                    sh 'docker run -d --name $CONTAINER_NAME -p 5000:5000 $IMAGE_NAME'
                }
            }
        }

        stage('Run') {
            steps {
                echo 'Running the application and checking health...'
                script {
                    // Ensure the application is running by hitting the health check endpoint
                    sh 'curl http://localhost:5000/check/system/operation'
                }
            }
        }
    }

    post {
    
        success {
            echo 'Pipeline completed successfully.'
        }

        failure {
            echo 'Pipeline failed.'
        }
    }
}
