#!/bin/bash

#install prereqs
yum install -y boost141
yum install -y compat-boost-regex

yum install -y R-devel
R CMD BATCH installR.r

. ~ec2-user/cfg_BestHPCC.sh

#install hpcc
mkdir hpcc
cd hpcc
echo "wget $hpcc_platform"
wget $hpcc_platform

echo "rpm -iv --nodeps $hpcc_platform"
rpm -iv --nodeps $hpcc_platform

cd ..
