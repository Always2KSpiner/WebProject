def awsCredentials = [[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws-personal']]
pipeline {
    options {
  withCredentials(awsCredentials)
}
    environment{
    registryCredential = 'spiner-dockerhub'
    }
    agent none
    stages {
        stage('Build') {
            agent { dockerfile true }
            steps {
                sh 'pwd'
                sh 'npm build'
            }
        }
    /*stage('Deploy'){
        agent any
        steps {
            script {
       docker.withRegistry( '', registryCredential ){
            def customImage = docker.build("always2kspiner/webproject:${env.BUILD_ID}")
            customImage.push()
                    }   
                }
            }
        }*/
        stage('AWS Deployment'){
            agent any
            steps{
                script{
                    aws.withCredentials(awsCredentials){
                dir('TerraformScripts'){
                sh 'terraform init'
                sh 'terraform apply'
                }
                    }
            }
        }
    }
}
