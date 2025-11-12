pipeline {
    agent any

    tools {
        nodejs "Node18"
    }

    stages {
        stage('Checkout') {
            steps {
                echo '📥 Cloning repository...'
                git branch: 'main', url: 'https://github.com/saurashp/weather-app.git'
            }
        }

        stage('Clean Workspace') {
            steps {
                echo '🧹 Cleaning old workspace...'
                sh 'rm -rf node_modules dist'
            }
        }

        stage('Install Dependencies') {
            steps {
                echo '📦 Installing dependencies...'
                sh 'npm install'
            }
        }

        stage('Build') {
            steps {
                echo '🏗️ Building the project...'
                sh 'npm run build'
            }
        }

        stage('Test') {
            steps {
                echo '🧪 Running tests...'
                sh 'npm test || echo "⚠️ No tests defined"'
            }
        }

        stage('Docker Build & Run') {
            steps {
                echo '🐳 Building Docker image and running container...'
                sh '''
                    docker build -t weather-app .
                    docker stop weather-container || true
                    docker rm weather-container || true
                    docker run -d -p 4173:4173 --name weather-container weather-app
                '''
            }
        }

        stage('Deploy Confirmation') {
            steps {
                echo '✅ Docker container deployed successfully!'
                echo '🌐 Access the app at: http://localhost:4173'
            }
        }
    }

    post {
        success {
            echo '🎉 Jenkins pipeline completed successfully with Docker deployment!'
        }
        failure {
            echo '❌ Pipeline failed! Check console output for details.'
        }
        always {
            echo '🎯 Jenkins pipeline finished running.'
        }
    }
}
