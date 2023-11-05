pipeline{
 agent{
     label "slave1"
 } 
 
 environment{
     EC2_PRIVATE_KEY=credentials("ec2privatekey")
 }
 stages{
  
      stage("GitCheckOut"){
          steps{
          git credentialsId: 'ce152094-edae-403e-829f-294ff8489331', url: 'https://github.com/doh-tech/jekins-ansible-dynimc-inv.git'    
          }
      }
      stage("Creating Server"){
          steps{
        sh "terraform -chdir=terraformscripts init " 
        sh "terraform -chdir=terraformscripts destroy --auto-approve"
      }      
      }/*
      stage("Running playbook"){
          steps{
        sh "ansible-inventory --graph -i inventory/aws_ec2.yaml" 
        sh "ansible-playbook -i inventory/aws_ec2.yaml playbooks/installTomcat9.yaml --private-key=$EC2_PRIVATE_KEY --ssh-common-args='-o StrictHostKeyChecking=no'"
      }      
      }
     */
 }//stage closing
 }//pipeline closing
