pipeline {
    agent any
    stages {
        stage('init') {
             steps {
                /usr/local/bin/terraform init
            }
        }
        stage('plan') {
             steps {
               /usr/local/bin/terraform plan
            }
        }
        stage('stage 3') {
              steps {
                echo "running stage 3"
            }
        }

    }
}
