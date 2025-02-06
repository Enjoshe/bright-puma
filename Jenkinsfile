pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/Zaid0408/cloud-runner.git'
            }
        }

        stage('Build') {
            steps {
                sh '''
                    python3 -m venv venv  # Create a virtual environment
                    . venv/bin/activate && pip install --upgrade pip  # Activate the virtual environment and upgrade pip
                    . venv/bin/activate && pip install -r requirements.txt  # Install dependencies in the virtual environment
                '''
            }
        }

        // stage('Test') {
        //     steps {
        //         sh 'python3 -m unittest discover'
        //     }
        // }

        stage('Deploy') {
            steps {
                sh 'nohup python3 app.py &'
            }
        }
    }

    post {
        success {
            echo 'Pipeline executed successfully!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}
