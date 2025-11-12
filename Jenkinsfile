pipeline {
    agent any

    tools {
        nodejs "Node18"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/saurashp/weather-app.git'
            }
        }

        stage('Clean Workspace') {
            steps {
                echo '🧹 Cleaning old workspace...'
                bat 'del /Q *'   // Windows equivalent of rm -rf *
            }
        }

        stage('Install Dependencies') {
            steps {
                bat 'npm install'
            }
        }

        stage('Build') {
            steps {
                bat 'npm run build'
            }
        }

        stage('Test') {
            steps {
                bat 'npm test'
            }
        }

        stage('Docker Build & Run') {
            steps {
                bat 'docker build -t weather-app .'
                bat 'docker run -d -p 3000:3000 weather-app'
            }
        }
    }

    post {
        success {
            echo '✅ Pipeline succeeded!'
        }
        failure {
            echo '❌ Pipeline failed!'
        }
    }
}
