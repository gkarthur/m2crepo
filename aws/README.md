# M2C AWS Induz


## Step 1 : Init administrator AWS CLI and API

Go to AWS console and select IAM service  
Create new user with following entries:  
creation user = m2cAdminCLI  
group = m2cAdminAccess, permission (policy=AdministratorAccess)  
Assign group to user  

For this user, generate access and secret key  
Access key ID = <AWS Access Key ID>  
Secret access key = <AWS Secret Key>  

## Step 2 : Installation of VM Provision

VM provision aims to create VM to AWS platform.

Get source code from Github

```
git clone https://github.com/.../m2crepo.git
```

Go to AWS console and select CloudFormation service.  
Create Stack, and load file m2crepo\aws\cloudformation\ec2-centos-provision.yml  

Connect to VM provision via SSH and configure as follow

```
ssh -i gkarthur-redhat001.pem centos@<dns-vm-provision>
sudo yum install git -y
git clone https://github.com/gkarthur/m2crepo.git
chmod +x /home/centos/m2crepo/aws/ansible/ec2inventory/ec2.py
chmod +x /home/centos/m2crepo/aws/sh/*.sh
./home/centos/m2crepo/aws/sh/init-provision.sh
```

Create a new VM with Ansible + AWS CLI (v2). For instance we will deploy Abafar stack with specific playbook

```
export AWS_ACCESS_KEY_ID='<AWS Access Key ID>'
export AWS_SECRET_ACCESS_KEY='<AWS Secret Key>'
cd /home/centos/m2crepo/aws/ansible/ec2-abafar
ansible-playbook site.yml
```

## Etape 4 : Deploy software to any VM with ansible

This chapter aims to deploy a basics playbook for install git wget and unzip on remote VM. In AWS context with dynamic DNS we need use EC2 inventory to get recent DNS by tag filter. 

```
scp -i gkarthur-redhat001.pem gkarthur-redhat001.pem centos@<dns-vm-provision>:/home/centos
ssh -i gkarthur-redhat001.pem centos@<dns-vm-provision>
sudo chmod 600 /home/centos/gkarthur-redhat001.pem
cd /home/centos/m2crepo/aws/ansible/ec2inventory/
export AWS_ACCESS_KEY_ID='<AWS Access Key ID>'
export AWS_SECRET_ACCESS_KEY='<AWS Secret Key>'
export EC2_INSTANCE_FILTERS='tag:ClusterName=abafar'
ansible-playbook -v -i ec2.py -u centos --private-key /home/centos/gkarthur-redhat001.pem -b /home/centos/m2crepo/ansible/playbook/basics.yml
```

## Etape 5 : Création service de suppression VM

