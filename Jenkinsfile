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
                bat 'dir' // to show what’s in workspace
            }
        }

        stage('Install, Build and Deploy') {
            steps {
                dir('weather-app') {   // 👈 Go inside the actual folder
                    echo '📦 Installing dependencies...'
                    bat 'npm install'

                    echo '🏗️ Building project...'
                    bat 'npm run build'

                    echo '🐳 Building Docker image and running container...'
                    bat '''
                        docker build -t weather-app .
                        docker stop weather-container || exit 0
                        docker rm weather-container || exit 0
                        docker run -d -p 4173:4173 --name weather-container weather-app
                    '''
                }
            }
        }

        stage('Deploy Confirmation') {
            steps {
                echo '✅ Docker container deployed successfully!'
                echo '🌐 Visit http://localhost:4173'
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
    }
}
