pipeline{
    agent {
        label "slave1"
    }
    environment{
        EC2_USER_KEY=credentials("ec2instanceprivatekey")
    }
    stages{
       stage("GitCheckOut"){
           steps{
              git credentialsId: '2f29cbb2-b2e8-4028-9f25-fc031a7fd916', url: 'https://github.com/doh-tech/jekins-ansible-dynimc-inv.git' 
       }
       } 
       stage("Running terraform script"){
           steps{
               sh "terraform -chdir=terraformscripts init"
               sh "terraform -chdir=terraformscripts apply --auto-approve"
           }
       }
        
}//closing stage
}//clossing pipeline
