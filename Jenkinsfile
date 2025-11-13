pipeline {
    agent any

    tools {
        nodejs "Node18"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/saurashp/weather-app.git'
                bat 'dir'
            }
        }

        stage('Install & Build') {
            steps {
                bat 'npm install'
                bat 'npm run build'
            }
        }

        stage('Docker Build & Run') {
            steps {
                bat '''
                    docker build -t weather-app .
                    docker stop weather-container || exit 0
                    docker rm weather-container || exit 0
                    docker run -d -p 4173:4173 --name weather-container weather-app
                '''
            }
        }
    }

    post {
        success {
            echo "SUCCESS: Visit app at http://localhost:4173"
        }
        failure {
            echo "Pipeline failed!"
        }
    }
}
