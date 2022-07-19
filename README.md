# Running CMSSW demo jobs in a container through GitHub workflows

This is a simple example on how to run a CMSSW test job through GitHub workflows using the CMSSW open data container image. 

The example has been set up for the [CMS Open Data workshop](https://cms-opendata-workshop.github.io/2022-08-01-cms-open-data-workshop/) participants who are not able to run CMSSW jobs in the container on their own computer, e.g. for those having a macOS with the M1 chip which gives errors when running amd-based containers.

Branch [`docker-04`](https://github.com/cms-opendata-workshop/workshop2022-CMSSW-container-demo/tree/docker-04) contains the code for the getting-started exercise of the [Docker pre-exercises](https://cms-opendata-workshop.github.io/workshop2022-lesson-docker/04-validation/index.html).

To get your own version of this repository click on the arrow to the right of Fork (top right), and choose “Create a new fork”. In your new repository, go to the Actions tab, and click on “I understand my workflow, go ahead and enable them”. Choose the workflow “Test CMSSW on plain docker” and run the workflow by selecting branch docker-04 under “Run workflow”.

You can follow the job progress and output by clicking on “DemoAnalyzer test - plain docker” and expanding on “Going to a container”, and if the job finishes with success, you will find the ouput under “Artifacts” in the workflow summary. In this example, it is the ouput log from the job above, but you could eventually produce some data files later on during this workshop and download them from the same place.

Note that every time the workflow runs it takes several minutes to start, as it needs to download the container image. This is certainly not ideal for quick testing, and you would not use this if you have it working on your computer. This is a workaround for those who were not able to run jobs on the container locally.

The workflow is defined in [.github/workflows/main.yaml](/.github/workflows/main.yaml) and the commands that are passed into the container are in [commands.sh](/commands.sh) in branch `docker-04` of the repository.
