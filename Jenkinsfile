
pipeline{
    agent{
        label "slave1"
    }
    
    environment {
        new_ec2_instance=credentials('ec2instance') 
    }
    stages{
      stage("Gitclone"){
          steps{
              git credentialsId: '61169445-e8b7-4128-b584-c3be0145c1ce', url: 'https://github.com/doh-tech/jekins-ansible-dynimc-inv.git'
          }
      }
      stage('Running terraform Script'){
          steps{
              sh "whoami"
              sh "hostname"
              sh "terraform -chdir=terraformscripts init"
              sh "terraform -chdir=terraformscripts apply --auto-approve"
      }
      }
      //Running Ansible playbook
      stage("running ansible playbook"){
          steps{
              sh "ansible-inventory --graph -i inventory/aws_ec2.yaml"
              sh "ansible-playbook -i inventory/aws_ec2.yaml --private-key=$new_ec2_instance playbooks/installTomcat9.yaml --ssh-common-args='-o StrictHostKeyChecking=no'"
          }
      }



        
}//stages clossing
}//pipeline clossing
