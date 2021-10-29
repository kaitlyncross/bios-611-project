This is a README file for Kaitlyn Cross's BIOS611 Final Project

##Step-by-Step Process For Executing This Project:

First, ensure that you have Docker and git downloaded and usable as your current user. If using a Windows machine, open the Docker application before you begin the steps below.

The following steps can be completed through the command line, or through standard point-and-click methods on your local machine:
- Create a clean file/directory to download this project into that is not the computer's root directory.
- Save the files provided at the latest commit of this repository into your directory.

Next, open your computer's shell scripting program and navigate to your project repository. [On a Windows computer, use PowerShell]

First, we will build a Docker image using our Dockerfile by running the code snippets below:

'docker build . -t bios611proj'
^This line creates a Docker image that customized the Rocker/verse image to include all programs and packages needed to execute this project
^NOTE - this Docker build can take a few minutes! 

Once the build is done running, execute this code snippet:

'docker run -v $PWD:/home/rstudio -p 8787:8787 -e PASSWORD=test -t bios611proj'
^This line initializes a container that has all the properties specified in the Dockerfile, and creates an Rstudio instance for you to interact with the project.

You can now navigate to your web browser and enter 'localhost:8787' in the address bar. This will take you to a login screen for Rstudio. Log in using:
	Username: rstudio
	Password: test

From here, select the "Terminal" tab. This is where we will use our makefile to execute the programs and generate our report.

To generate individual output, type 'make [TARGET.filetype]' (ex: 'make author.Rdata') and run.

To generate the final report, type 'make report.pdf' and run.

[Further details to come]