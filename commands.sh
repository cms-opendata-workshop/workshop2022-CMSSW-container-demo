#!/bin/sh -l
sudo chown $USER /mnt/vol

# the repository has been mounted into the container's /mnt/vol (see .github/workflows/main.yaml)
# copy it to the CMSSW working area in directory Demo
cp -r /mnt/vol Demo
cd Demo

# compile the code and run
scram b
cmsRun DemoAnalyzer/python/ConfFile_cfg.py > demo.out 2>&1

cp *.out /mnt/vol/
echo ls -l /mnt/vol
ls -l /mnt/vol
