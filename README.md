p4factory repository
========

To test the reference implementation of the Inband Network Telemetry (INT)
specification, please refer to this [README](apps/int/README.md) and ignore the
warning below.

***This repository is in the process of being deprecated. If you are looking to
   experiment with the P4 language and with the P4 behavioral-model, please
   visit the [tutorials repository](https://github.com/p4lang/tutorials).***

If you wish to use this repository anyway, please refer to
[USAGE.md](USAGE.md).

User needs to follow these steps before pulling this repository 


sudo apt-get install linux-generic-lts-vivid
sudo apt-get install python3
sudo apt-get install python3-pip
sudo apt-get install bridge-utils
sudo pip3 install scapy-python3 
sudo pip3 install websockets
sudo apt-get install python-setuptools

cd /home/<hostname>
mkdir p4git
cd p4git
git clone https://github.com/p4lang/p4-hlir.git
git clone https://github.com/p4lang/behavioral-model.git
git clone https://github.com/p4lang/p4c-bm.git
git clone https://github.com/p4lang/scapy-vxlan.git


cd p4-hlir
sudo python setup.py install
cd ..
git https://github.com/addogra/p4factory.git
cd p4factory/
git submodule update --init --recursive
./install_deps.sh


sudo apt-get update

sudo tools/veth_setup.sh
cd submodules/bm
./autogen.sh
./configure --enable-debugger --with-pdfixed --prefix=/home/<hostname>/p4git/INSTALL
make
sudo make install


cd ../p4c-bm
sudo pip install -r requirements.txt
sudo python setup.py install
cd ../switch
./autogen.sh
./configure --with-bmv2 --with-switchlink --enable-thrift --prefix=/home/<hostname>/p4git/INSTALL
make
sudo make install


cd ../../../mininet ==> pull it from p4 git

sudo make clean

sudo ./util/install.sh -fnv


apt list --installed

apt-get -o Debug::pkgAcquire::Auth=true update

sudo apt-get remove docker docker-engine docker.io

#>sudo apt-get clean
#>sudo apt-get update

sudo apt-get install software-properties-common python-software-properties


For Installing Docker , follow the steps mentioned at this link 

https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-16-04

After you install docker and check if its working well by using sudo docker run hello-world


cd ../../makefiles
make -f docker.mk bmv2-docker-image installpath=/home/<hostname>/p4git/INSTALL
cd apps/int/vxlan-gpe
make clean
make
sudo ./install_driver.sh   ==> This will install the VXLAN module in the kernel (Do lsmod | grep vxlan to verify if its running)
cd ../../../

sudo ./p4factory/tools/veth_setup.sh   ==> This will create the Virtual Interfaces required for the Demo 

cd p4factory/mininet
sudo ./int_ref_topology.py --model-dir=/home/<hostname>/p4git/INSTALL





TCP DUMP 

For running TCP DUMP IN DOCKER 

sudo apt-get install tcpdump ==> in docker 
sudo tcpdump -i leaf1-eth1 -vv

mv /usr/sbin/tcpdump /usr/bin/tcpdump

sudo /usr/bin/tcpdump -i leaf1-eth1 -vv



