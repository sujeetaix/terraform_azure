pipeline {
    agent any
    stages {
        stage('init') {
             steps {
                bash '''
                /usr/local/bin/terraform init
                '''
            }
        }
        stage('plan') {
             steps {
                bash '''
               /usr/local/bin/terraform plan
               '''
            }
        }
        stage('stage 3') {
              steps {
                 bash '''
                echo "running stage 3"
                '''
            }
        }

    }
}
