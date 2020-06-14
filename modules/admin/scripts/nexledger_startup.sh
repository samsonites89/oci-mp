#!/bin/bash
# Copyright 2017, 2019, Oracle Corporation and/or affiliates.  All rights reserved.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl

# Nexledger v2.2 installation by JJ
for e in $(echo "${nexledger_opt}" | tr ',' ' '); do
   export $e
done


#분기 로직

cd /home/ubuntu/nexledger

if [ $NEX == "N" ]; then

   # remove unncessary tar files
   rm -rf exeShell_E_2_2_0.tar
   rm -rf exeShell_H_2_2_0.tar
   rm -rf images_E_2_2_0.tar
   rm -rf images_H_2_2_0.tar


   # load docker images
   docker load < images_N_2_2_0.tar

   # get script
   tar -xf exeShell_N_2_2_0.tar

elif [ $NEX == "H" ]; then
   # remove unncessary tar files
   rm -rf exeShell_E_2_2_0.tar
   rm -rf exeShell_N_2_2_0.tar
   rm -rf images_E_2_2_0.tar
   rm -rf images_N_2_2_0.tar

   # load docker images
   docker load < images_H_2_2_0.tar

   # get script
   tar -xf exeShell_H_2_2_0.tar

elif [ $NEX == "E" ]; then
   # remove unncessary tar files
   rm -rf exeShell_N_2_2_0.tar
   rm -rf exeShell_H_2_2_0.tar
   rm -rf images_N_2_2_0.tar
   rm -rf images_H_2_2_0.tar

   # load docker images
   docker load < images_E_2_2_0.tar

   # get script
   tar -xf exeShell_E_2_2_0.tar

fi



#./DEV-2.2-v3/nxg/install-v2.2.sh > oc.out 2>&1
#echo "Finished installation for Nexledger v2.2 ! ...." > ../finish.out
