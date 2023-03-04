pipeline {
        
    environment {
       subscription_id = "eab6752d-bcf9-498e-95e8-5321c360dce3"
      }
    
    parameters {
        choice(name: 'mode', choices: ['plan', 'apply'], description: 'Select Plan or Apply')
    }
   
    stages {
        stage('init') {
             steps {
                withCredentials([usernamePassword(credentialsId: 'AZ_login_creds', passwordVariable: 'password', usernameVariable: 'username')]) {
                sh  'az login -u $username -p $password '
                sh  'az account set -s "${subscription_id}"'
                sh  'terraform init'
                }
            }
        }
        stage('validate') {
             steps {
                sh '''
                /usr/local/bin/terraform validate
                '''
            }
        }
        stage('Terraform plan') {
              steps {
                 sh '''
                 /usr/local/bin/terraform plan -lock=false
                 '''
            }
        }
     
        stage('approval') {
          options {
            timeout(time: 1, unit: 'HOURS')
          }
          steps { 
            input 'approval for apply'
              }
          }
        
        stage('Terraform apply') {
            when {
                equals expected: "apply", actual: env.mode
            }
            steps {
                sh '''
                /usr/local/bin/terraform apply -lock=false -auto-approve
                '''
            }
        }
    }

post {
    failure {
            mail to: 'mbharathk23@gmail.com',
            subject: "Pipeline Failed: ${currentBuild.fullDisplayName}",
            body: "Something is wrong with ${env.BUILD_URL}"
            }
    
    success {
            mail to: 'mbharathk23@gmail.com',
            subject: "Pipeline Success: ${currentBuild.fullDisplayName}",
            body: "Pipeline is successful ${env.BUILD_URL} ${env.BUILD_ID}"
            }
  
    always {
        cleanWs()
           }
    }
}

