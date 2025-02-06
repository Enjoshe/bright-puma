pipeline {
    agent any

    environment {
        REPO_URL = 'https://github.com/Enjoshe/bright-puma.git'
        BRANCH = 'main'
        VENV_DIR = 'venv'
        FLASK_APP = 'app.py'
    }

    stages {
        stage('Checkout') {
            steps {
                echo 'Checking out code from GitHub...'
                git branch: "${BRANCH}", url: "${REPO_URL}"
            }
        }

        stage('Install Python and Dependencies') {
            steps {
                script {
                    // Check the operating system
                    if (isUnix()) {
                        echo 'Running on Linux/Unix'
                        sh '''
                            echo "Installing Python and virtual environment..."
                            sudo apt update
                            sudo apt install -y python3 python3-venv python3-pip
                            python3 -m venv ${VENV_DIR}
                            . ${VENV_DIR}/bin/activate
                            pip install --upgrade pip
                            pip install -r requirements.txt
                        '''
                    } else {
                        echo 'Running on Windows'
                        bat '''
                            echo "Installing Python and virtual environment..."
                            choco install python --version=3.10 -y
                            python -m venv ${VENV_DIR}
                            call ${VENV_DIR}\\Scripts\\activate
                            pip install --upgrade pip
                            pip install -r requirements.txt
                        '''
                    }
                }
            }
        }

        stage('Run Tests') {
            steps {
                script {
                    if (isUnix()) {
                        sh '. ${VENV_DIR}/bin/activate && python -m pytest tests/'
                    } else {
                        bat 'call ${VENV_DIR}\\Scripts\\activate && python -m pytest tests/'
                    }
                }
            }
        }

        stage('Deploy Application') {
            steps {
                script {
                    if (isUnix()) {
                        sh '. ${VENV_DIR}/bin/activate && nohup python ${FLASK_APP} > flask.log 2>&1 &'
                    } else {
                        bat 'call ${VENV_DIR}\\Scripts\\activate && start python ${FLASK_APP}'
                    }
                }
            }
        }

        stage('Verify Deployment') {
            steps {
                script {
                    if (isUnix()) {
                        sh 'sleep 10 && curl -X GET http://localhost:5000/check/system/operation'
                    } else {
                        bat 'timeout /t 10 && curl -X GET http://localhost:5000/check/system/operation'
                    }
                }
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed. Check the logs for details.'
        }
    }
}
