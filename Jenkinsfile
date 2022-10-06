pipeline {
    agent {
          docker {
              image "votingappdemobharath.azurecr.io/image:1.0"
              args "--user root --privileged"
              alwaysPull true
              registryUrl "https://votingappdemobharath.azurecr.io"
              registryCredentialsId "ACR"
              }
           }
    
    environment {
        MY_CRED = credentials('	azure-serviceprinciple-credentials')
      }
    
    parameters {
        choice(name: 'mode', choices: ['plan', 'apply'], description: 'Select Plan or Apply')
    }
   
    stages {
        stage('init') {
             steps {
                sh '''
                az login -u terraformuser@saimsv528outlook.onmicrosoft.com -p "Soga8810"
                /usr/local/bin/terraform init 
                '''
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
