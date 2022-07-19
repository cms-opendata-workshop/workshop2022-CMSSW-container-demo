#!/bin/sh -l
sudo chown $USER /mnt/vol

# the repository has been mounted into container's /mnt/vol, copy it to the CMSSW working area
cp -r /mnt/vol Demo
cd Demo
scram b

# config=DemoAnalyzer/python/ConfFile_cfg.py
# find the line with the event number and set the number of events to 10
# eventline=$(grep maxEvents $config)
# sed -i "s/$eventline/process.maxEvents = cms.untracked.PSet( input = cms.untracked.int32(10) )/g" $config
# find the line with the file name and set it to a 2015 MiniAOD file (all "/" in the filename must be escaped with "\/")
# fileline=$(grep "file:myfile.root" $config)
# sed -i "s/$fileline/'root:\/\/eospublic.cern.ch\/\/eos\/opendata\/cms\/Run2015D\/SingleElectron\/MINIAOD\/08Jun2016-v1\/10000\/001A703B-B52E-E611-BA13-0025905A60B6.root'/g" $config

cmsRun $config > demo.out 2>&1

cp *.out /mnt/vol/
echo ls -l /mnt/vol
ls -l /mnt/vol
