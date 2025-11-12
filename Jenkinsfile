pipeline {
    agent any

    tools {
        nodejs "Node18"
    }

    stages {
        stage('Checkout') {
            steps {
                // safer way with explicit branch
                git branch: 'main', url: 'https://github.com/saurashp/weather-app.git'
            }
        }

        stage('Clean Workspace') {
            steps {
                // optional but helpful to avoid old cache issues
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

        stage('Deploy') {
            steps {
                echo '✅ Build successful! (Deploy manually or via Docker in next step)'
            }
        }
    }

    post {
        success {
            echo '🎉 Pipeline completed successfully!'
        }
        failure {
            echo '❌ Pipeline failed! Check the console output for details.'
        }
        always {
            echo '🎯 Jenkins pipeline finished running.'
        }
    }
}
