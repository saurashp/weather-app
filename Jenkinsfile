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
                // Windows equivalent of rm -rf *
                bat 'del /Q * 2>nul || echo Workspace clean'
            }
        }

        stage('Install Dependencies') {
            steps {
                echo '📦 Installing dependencies...'
                bat 'npm install'
            }
        }

        stage('Build') {
            steps {
                echo '🏗️ Building project...'
                bat 'npm run build'
            }
        }

        stage('Test') {
            steps {
                echo '🧪 Running tests...'
                bat 'npm test'
            }
        }

        stage('Docker Build & Run') {
            steps {
                echo '🐳 Building Docker image...'
                bat 'docker build -t weather-app .'
                echo '🚀 Running container...'
                bat 'docker run -d -p 3000:3000 weather-app'
            }
        }

        stage('Deploy Confirmation') {
            steps {
                echo '✅ Deployment successful!'
            }
        }
    }

    post {
        success {
            echo '🎯 Jenkins pipeline finished successfully.'
        }
        failure {
            echo '❌ Pipeline failed! Check console output for details.'
        }
    }
}
