pipeline {
    agent any
    stages {
        stage('init') {
             steps {
                sh '''
                /usr/local/bin/terraform init -backend-config="key=qa.terraform.tfstate" -reconfigure
                '''
            }
        }
        stage('plan') {
             steps {
                sh '''
               /usr/local/bin/terraform plan -var-file="qa.terraform.tfvars" 
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
