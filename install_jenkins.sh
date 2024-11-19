#!/bin/bash
sudo yum -y update

echo "Installing Java JDK 17"
JAVA_VERSION="17"  # Replace with the desired Java version

# Install Java JDK
sudo dnf install -y java-"${JAVA_VERSION}"-amazon-corretto
sudo dnf install -y java-"${JAVA_VERSION}"-amazon-corretto-devel

# Set Java environment variables
echo "export JAVA_HOME=/usr/lib/jvm/java-${JAVA_VERSION}-amazon-corretto" >> ~/.bash_profile
echo "export PATH=\$JAVA_HOME/bin:\$PATH" >> ~/.bash_profile

# Reload the profile to apply changes
source ~/.bash_profile



echo "Installing Maven"
MAVEN_VERSION="3.9.8"  # Replace with the desired Maven version
sudo yum install -y maven-"${MAVEN_VERSION}"
# Set Maven environment variables
echo "export M2_HOME=/usr/share/maven" >> ~/.bash_profile
echo "export M2=\$M2_HOME/bin" >> ~/.bash_profile
echo "export PATH=\$M2:\$PATH" >> ~/.bash_profile

# Reload the profile to apply changes
source ~/.bash_profile


echo "Install git"
yum install -y git

echo "Install Docker engine"
DOCKER_VERSION="20.10.0"  # Replace with the desired Docker version

# Update package information
sudo yum update -y

# Install a specific version of Docker
sudo amazon-linux-extras install -y docker="${DOCKER_VERSION}"

# Start and enable the Docker service
sudo service docker start
sudo chkconfig docker on


echo ##################"Installing Jenkins"#######################
echo "Installing Jenkins"
JENKINS_VERSION="2.401.3"  # Replace with the desired Jenkins version
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum -y upgrade
sudo yum -y install jenkins-"${JENKINS_VERSION}"
sudo chkconfig jenkins on
sudo chkconfig docker on
sudo service docker start
sudo service jenkins start


echo ###############"Installing Terraform"##################
# Define the desired Terraform version
TERRAFORM_VERSION="1.5.4"  # Replace with the desired version

# Download and install Terraform
sudo yum install -y unzip
sudo curl -LO "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip"
sudo unzip "terraform_${TERRAFORM_VERSION}_linux_amd64.zip" -d /usr/local/bin/
sudo rm "terraform_${TERRAFORM_VERSION}_linux_amd64.zip"

# Verify the installation
terraform version

