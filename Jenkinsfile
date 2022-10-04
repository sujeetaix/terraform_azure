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
        stage('validate') {
             steps {
                sh '''
               /usr/local/bin/terraform validate -lock=false 
               '''
            }
        }
        stage('Terraform plan') {
              steps {
                 sh '''
                echo "/usr/local/bin/terraform plan -lock=false"
                '''
            }
        }

        stage('Terraform apply') {
            when {
                equals expected: "apply", actual: env.mode
            }
            steps {
                sh '''
                echo "/usr/local/bin/terraform apply -lock=false -auto-approve"
                '''
            }
        }

    }
}
