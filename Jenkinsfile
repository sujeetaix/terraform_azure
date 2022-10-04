pipeline {
    agent any
    stages {
        stage('init') {
             steps {
                terraform init
            }
        }
        stage('plan') {
             steps {
               terraform plan
            }
        }
        stage('stage 3') {
              steps {
                echo "running stage 3"
            }
        }

    }
}
