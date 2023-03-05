pipeline {
    agent any; 
    environment {
       MY_CRED = credentials('azure_login')
    } 
    parameters {
        choice(name: 'mode', choices: ['plan', 'apply', 'destroy'], description: 'Select Plan or Apply or Destroy')
    }   
    stages {
        stage('azurelogin') {
        steps {
          sh 'az login --service-principal -u $MY_CRED_CLIENT_ID -p $MY_CRED_CLIENT_SECRET -t $MY_CRED_TENANT_ID'
            }
        }
        stage('Terraform Init'){
            steps {
                    withCredentials([azureServicePrincipal(
                    credentialsId: 'azure_login',
                    subscriptionIdVariable: 'ARM_SUBSCRIPTION_ID',
                    clientIdVariable: 'ARM_CLIENT_ID',
                    clientSecretVariable: 'ARM_CLIENT_SECRET',
                    tenantIdVariable: 'ARM_TENANT_ID'
                )]) {
                        sh """                    
                        echo "Initialising Terraform"
                        /usr/bin/terraform init
                        """
                           }
                 }
        }
    
        stage('Terraform Validate'){
            steps {
                    withCredentials([azureServicePrincipal(
                    credentialsId: 'azure_login',
                    subscriptionIdVariable: 'ARM_SUBSCRIPTION_ID',
                    clientIdVariable: 'ARM_CLIENT_ID',
                    clientSecretVariable: 'ARM_CLIENT_SECRET',
                    tenantIdVariable: 'ARM_TENANT_ID'
                )]) {
                        sh """                    
                        echo "validating Terraform Code"
                        /usr/bin/terraform validate
                        """
                           }
                 }
        }
        stage('Terraform Plan'){
            steps {
                    withCredentials([azureServicePrincipal(
                    credentialsId: 'azure_login',
                    subscriptionIdVariable: 'ARM_SUBSCRIPTION_ID',
                    clientIdVariable: 'ARM_CLIENT_ID',
                    clientSecretVariable: 'ARM_CLIENT_SECRET',
                    tenantIdVariable: 'ARM_TENANT_ID'
                )]) {
                        sh """                    
                        echo "Plan Terraform"
                        /usr/bin/terraform plan
                        """
                           }
                 }
        }
        stage('approval') {
          options {
            timeout(time: 1, unit: 'HOURS')
          }
          steps { 
            input 'approval for apply or destroy'
              }
          }
        stage('Terraform apply') {
            when {
                equals expected: "apply", actual: env.mode
            }
            steps {
                    withCredentials([azureServicePrincipal(
                    credentialsId: 'azure_login',
                    subscriptionIdVariable: 'ARM_SUBSCRIPTION_ID',
                    clientIdVariable: 'ARM_CLIENT_ID',
                    clientSecretVariable: 'ARM_CLIENT_SECRET',
                    tenantIdVariable: 'ARM_TENANT_ID'
                )]) {
                    sh """                    
                        echo "Apply Terraform"
                        /usr/bin/terraform apply -lock=false -auto-approve
                        """
                           }
                 }
        }
        stage('Terraform Destroy') {
            when {
                equals expected: "destroy", actual: env.mode
            }
            steps {
                    withCredentials([azureServicePrincipal(
                    credentialsId: 'azure_login',
                    subscriptionIdVariable: 'ARM_SUBSCRIPTION_ID',
                    clientIdVariable: 'ARM_CLIENT_ID',
                    clientSecretVariable: 'ARM_CLIENT_SECRET',
                    tenantIdVariable: 'ARM_TENANT_ID'
                )]) {
                    sh """                    
                        echo "Destroy Terraform"
                        /usr/bin/terraform destroy -lock=false -auto-approve
                        """
                      }
                 }
        }
        
    }
post {
    failure {
                echo "Jenkins Build Failed"
            }
    
    success {
                echo "Jenkins Build Success"
            }
    always {
        cleanWs()
           }
    }
}
