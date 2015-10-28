# vagrant-apache-spark-ubuntu-standalone-cluster

## 1. Introduction
Vagrant project to spin up a cluster of 3 nodes, Ubuntu 12.04 LTS 64-bit virtual machines with Apache Spark 1.5.1 (pre-built for Apache Hadoop 2.4).
- node1 : Spark Master (192.168.200.201)
- node2 : Spark Slave (192.168.200.202)
- node3 : Spark Slave (192.168.200.203)

## 2. Prerequisites
1. At least 1GB memory for each VM node. The default script provided is for 3 nodes, so you need 3GB for the nodes, in addition to the memory for your host machine.
2. Vagrant 1.7 or higher.
3. VirtualBox 4.3.2 or higher.

## 3. Getting Started
1. Download and install VirtualBox.
2. Download and install Vagrant.
3. Git clone this project, and change directory into this project directory.
4. [Download Spark 1.5.1 (pre-built for Apache Hadoop 2.4)](http://d3kbcqa49mib13.cloudfront.net/spark-1.5.1-bin-hadoop2.4.tgz) into the `/resources` directory
5. Run `vagrant up` to create the VM.
6. Run `ssh vagrant@192.168.200.201` to get into your Spark master node.
7. Run `/home/vagrant/spark-1.5.1-bin-hadoop2.4/sbin/start-all.sh` to start Spark master and all slave nodes.
8. View the Spark web UI at `http://192.168.200.201:8080/`.
9. Run `vagrant destroy` when you want to destroy and get rid of the VM.

## 4. Note
- `spark-1.5.1-bin-hadoop2.4.tgz` (from Apache Spark official site) has to be downloaded and placed inside the `/resources` directory (to speed up the vagrant destroy & up process). In the future, this will be included as part of the base box.
- log4j log level is configured to WARN.
- This uses Open JDK 7.
- This comes with Python 2.7.x.

## 5. References
This project was put together with great pointers from all around the internet.

## 6. Copyright
Copyright 2015 Jaeyoung Chun

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0
Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
