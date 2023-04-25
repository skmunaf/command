#!/bin/bash
#Install docker in ec2 and change the permissions of the docker.sock
#sudo usermod -a -G docker ec2-user
#sudo chmod 666 /var/run/docker.sock
#sudo systemctl enable docker.service
#sudo systemctl start docker.service

docker build -t skmunaf/jenkins
docker login -u skmunaf -p Abdul@2023
docker push skmunaf/jenkins
