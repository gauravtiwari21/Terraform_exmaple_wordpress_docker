# Terraform_exmaple_wordpress_docker
Terraform based provisioner to setup wordpress on docker and ansible using mysql RDS. This code will create a VPC launch an RDS instance with privated access, launch required number of web instances running wordoress docker image and setup ELB with public access.

# Pre-requisites:
1. Should have following environment variables set 

        A. AWS_KEY_PATH         (This is the location of aws key pair pem)
        B. AWS_KEY_PAIR_NAME    (Name of the AWS key pair)
        C. AWS_ACCESS_KEY       (Access key required to communicate with AWS)
        D. AWS_SECRET           (AWS secret required to communicate with AWS)
        E. DB_USERNAME          (Master username of RDS mysql instance, RDS instance will be created with this user)
        F. DB_PASSWORD          (Password for the RDS master user above)
        
2. Should have a key pair created in AWS and available locally, the name of that key pair is already mentioned above .
3. Both Terraform and Terraform-inventory must be installed
   ```
      # Run this on MAC OSX
      brew install terraform
      brew install terraform-inventory
   ```
4. Ansible commandline should be installed. The script will run ansible-playbook command

# How to run:
Run the following commands
```
   cd terraform
   ./cloud-automation.sh <APP_NAME> <ENVIRONMENT> <COUNT> <SIZE>
```

```
<APP_NAME>      Name of the app you wish to set
<ENVIRONMENT>   The environment name 
<COUNT>         Number of instances required running web
<SIZE>          AWS instance type for example "t2.micro"
```
