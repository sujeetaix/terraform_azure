pipeline {
    agent any
    stages {
        stage('init') {
             steps {
                sh '''
                /usr/local/bin/terraform init 
                '''
            }
        }
        stage('plan') {
             steps {
                sh '''
               /usr/local/bin/terraform plan -lock=false
               '''
            }
        }
        stage('stage 3') {
              steps {
                 sh '''
                echo "running stage 3"
                '''
            }
        }

    }
}
