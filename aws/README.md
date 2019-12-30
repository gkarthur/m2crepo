# AWS Induz


## Step 1 : Init administrator AWS CLI and API

Go to AWS console and select IAM service
Create new user with following entries:
creation user = m2cAdminCLI 
group = m2cAdminAccess, permission (policy=AdministratorAccess)
Assign group to user

For this user, generate access and secret key
Access key ID = AKIAZ5KTK6QFDGVYYFXO
Secret access key = 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


## Step 2 : Installation of VM Provision

VM provision aims to create VM to AWS platform.

Get source code from Github

```
git clone https://github.com/.../m2crepo.git
```

Go to AWS console and select CloudFormation service
Create Stack, et load file m2crepo\aws\ansible\ec2-centos-provision.yml

Connect to VM provision via SSH and configure as follow

```
ssh -i gkarthur-redhat001.pem centos@<dns-vm-provision>
sudo yum install git -y
git clone https://github.com/gkarthur/m2crepo.git
chmod +x m2crepo/ansible/ec2inventory/ec2.py
chmod +x m2crepo/sandbox/*.sh
./m2crepo/sandbox/init-provision.sh
```

Create a new VM with ansible. For instance we will deploy Abafar stack with specific playbook

```
export AWS_ACCESS_KEY_ID='AKIAZ5KTK6QFDGVYYFXO'
export AWS_SECRET_ACCESS_KEY='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'
cd m2crepo/aws/ansible/ec2-abafar
ansible-playbook site.yml
```

## Etape 4 : Deploy software to any VM with ansible


## Etape 5 : Création service de suppression VM

