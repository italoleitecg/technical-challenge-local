# technical-challenge-local
This is a repository to create local infrastructure using Vagrant and deploy the application in Kubernetes.


The goal of this exercise is to spin up locally a single Linux box automatically provisioned with
Kubernetes serving a web application up and running in that box.

No human interaction is needed except for changes in the configuration before starting the automated
deployment.

When the whole process is completed, the web application is accessible at: http:<IP ADDRESS>. No need
for HTTS, and the port should be 80.