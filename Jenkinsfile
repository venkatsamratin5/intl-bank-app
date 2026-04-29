pipeline {
    agent any

    stages {

        stage('Clean Workspace') {
            steps {
                deleteDir()
            }
        }

        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/venkatsamratin5/intl-bank-app.git'
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Deploy') {
            steps {
                sh '''
                docker rm -f tomcatcont1 tomcatcont2 tomcatcont3 tomcatcont4 apachecont1 bank-visual-dashboard bank-monitor-collector || true
                docker compose up -d --build
                '''
            }
        }
    }
}
