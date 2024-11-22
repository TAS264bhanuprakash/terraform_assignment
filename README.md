# terraform_assignment
**Write a Terraform script to create a custom VPC and deploy two EC2 VMs on AWS using Terraform. The code should be broken into three different parts:**

1. **Networking**: Define the VPC and all of its components.
2. **SSH-Key**: Dynamically create an SSH key pair for connecting to VMs.
3. **EC2**: Deploy a VM in the public subnet and deploy another VM in a private subnet.
4. **NGINX**: Ensure NGINX is installed and accessible from the internet on the public VM.
5. **Automate Terraform Deployment**: Use Jenkins Pipelines to automate the deployment process.

**Step1 : Installation Of Terraform**

    sudo apt update

    sudo apt install -y gnupg software-properties-common

    curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo gpg -o /etc/apt/trusted.gpg.d/hashicorp.asc

    sudo apt-add-repository "deb https://apt.releases.hashicorp.com $(lsb_release -cs) main" 

    sudo apt update

    sudo apt install terraform

    terraform --version
**Step2 : Installation of Jenkins**

    sudo apt update

    sudo apt install -y openjdk-11-jdk


    curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
    /usr/share/keyrings/jenkins-keyring.asc > /dev/null
    echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
    https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
    /etc/apt/sources.list.d/jenkins.list > /dev/null

    sudo apt update

    sudo apt install -y jenkins

    sudo systemctl start jenkins

    sudo systemctl enable jenkins
    
    sudo systemctl status jenkins

**Get the initial admin password**

    sudo cat /var/lib/jenkins/secrets/initialAdminPassword

**Access Jenkins at**

     http://localhost:8080


**Step 3: Write the Required Files**  

**Step 4: Create a GitHub Repository**

**Step 5: Push The Entire Files to Git Hub**

**Step 6: In Jenkins Create a AWS Credentials of Access Key and Secret Access Key**

**Step7: Write the Jenkins File**
```
pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID     = credentials('aws')  // Update credentials ID
        AWS_SECRET_ACCESS_KEY = credentials('aws')
        AWS_DEFAULT_REGION    = 'us-west-1'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', credentialsId: 'github-credentials-id', url: 'https://github.com/TAS264bhanuprakash/terraform_assignment'
                sh 'ls -la'
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'terraform plan'
            }
        }

        stage('Terraform Apply') {
            steps {
                // Add -auto-approve to bypass interactive prompt
                sh 'terraform apply -auto-approve'
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}
```


**Step 8:Run The Pipeline**
**After Running you Will Get the Public_IP Copy That and Past it in the Browser**




