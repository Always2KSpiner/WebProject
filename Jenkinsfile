pipeline {
    agent none
    stages {
        stage('Build') {
            agent (dockerfile true}
            steps {
                sh 'npm install'
                sh 'npm build'
            }
        }
    }
}
