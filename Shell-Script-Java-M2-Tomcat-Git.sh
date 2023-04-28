#!bin/mash
cd /opt
#sudo chown -R office:office /opt
sudo chown -R ec2-user:ec2-user /opt
#Download Java
wget https://github.com/adoptium/temurin8-binaries/releases/download/jdk8u362-b09/OpenJDK8U-jdk_x64_linux_hotspot_8u362b09.tar.gz
# Un tar
tar -zxvf OpenJDK8U-jdk_x64_linux_hotspot_8u362b09.tar.gz
#change the file name
mv jdk8u362-b09/ java8
#Download Maven
wget https://dlcdn.apache.org/maven/maven-3/3.9.1/binaries/apache-maven-3.9.1-bin.tar.gz
# Un tar
tar -zxvf apache-maven-3.9.1-bin.tar.gz
#change the file name
mv apache-maven-3.9.1 maven3
# Download tomcat
wget https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.88/bin/apache-tomcat-8.5.88.tar.gz
#Untar
tar -zxvf apache-tomcat-8.5.88.tar.gz
#change the file name
mv apache-tomcat-8.5.88 tomcat8
#Download Jenkins 2.344
wget https://updates.jenkins.io/download/war/2.344/jenkins.war
#Install Fontconfig for Jenkins to start with out error
sudo yum install fontconfig
#Copy war file from jenkins to tomcat/webapps
cp /opt/jenkins.war /opt/tomcat8/webapps
# Adding the path in etc/profile 
sudo sed -i '$a export JAVA_HOME=/opt/java8' /etc/profile
sudo sed -i '$a export PATH=$PATH:/opt/java8/bin' /etc/profile
sudo sed -i '$a export M2_HOME=/opt/maven3' /etc/profile
sudo sed -i '$a export PATH=$PATH:/opt/maven3/bin' /etc/profile
#Downlold Git
sudo yum install git
#rm -rf OpenJDK8U-jdk_x64_linux_hotspot_8u362b09.tar.gz apache-maven-3.9.1-bin.tar apache-tomcat-8.5.87.tar
#Start the Tomcat Services
sh /opt/tomcat8/bin/startup.sh
sudo yum update
# if we are installing it in the local we should use sudo apt install docker.io 
sudo yum install docker
# Docker group user in the ec2
sudo usermod -a -G docker ec2-user
sudo systemctl enable docker.service
sudo systemctl start docker.service
#put the password to the Ec2 "sudo passwd ec2-user" 2nd step "sudo vi /etc/ssh/sshd_config" change the password attan.... from no to yes
#sudo systemctl restart sshd - this will start the services 
