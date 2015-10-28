# update
sudo apt-get -y update

# install jdk7
sudo apt-get -y install openjdk-7-jdk

# get spark 1.5.1 from shared directory and unzip
#sudo wget http://d3kbcqa49mib13.cloudfront.net/spark-1.5.1-bin-hadoop2.4.tgz
sudo tar -zxf /vagrant/resources/spark-1.5.1-bin-hadoop2.4.tgz

# fix permission
sudo chown -R vagrant spark-1.5.1-bin-hadoop2.4
sudo chgrp -R vagrant spark-1.5.1-bin-hadoop2.4


# log settings
sudo cp /vagrant/resources/log4j.properties /home/vagrant/spark-1.5.1-bin-hadoop2.4/conf

sudo chown -R vagrant:vagrant spark-1.5.1-bin-hadoop2.4/conf/log4j.properties

# spark environment
echo "#!/usr/bin/env bash
SPARK_MASTER_IP=192.168.200.201
SPARK_LOCAL_IP=192.168.200.20${1}
" > /home/vagrant/spark-1.5.1-bin-hadoop2.4/conf/spark-env.sh

sudo chown -R vagrant:vagrant /home/vagrant/spark-1.5.1-bin-hadoop2.4/conf/spark-env.sh

# slaves file
rm -rf /home/vagrant/spark-1.5.1-bin-hadoop2.4/conf/slaves
for i in `seq 2 $2`;
do
	echo "192.168.200.20${i}" >> /home/vagrant/spark-1.5.1-bin-hadoop2.4/conf/slaves
done

sudo chown -R vagrant:vagrant /home/vagrant/spark-1.5.1-bin-hadoop2.4/conf/slaves


# copy ssh config
cp /vagrant/resources/config /home/vagrant/.ssh
sudo chown -R vagrant:vagrant /home/vagrant/.ssh/config

# passwordless ssh to slaves
# private key is only required in master
if [ $1 -eq "1" ]; then
	cp /vagrant/resources/id_dsa /home/vagrant/.ssh
	sudo chown vagrant:vagrant /home/vagrant/.ssh/id_dsa
	sudo chmod 600 /home/vagrant/.ssh/id_dsa
fi
# public key on all slaves
cat /vagrant/resources/id_dsa.pub >> /home/vagrant/.ssh/authorized_keys


echo "set nocompatible" > /home/vagrant/.vimrc
sudo chown vagrant:vagrant /home/vagrant/.vimrc
