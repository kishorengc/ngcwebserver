######
# Bowl commands
#
#####

.DEFAULT_GOAL := help

SHELL := /bin/zsh

GKE_REPO := us-west1-docker.pkg.dev/blissful-hash-318902/bowl-repo
DOCKER_NAME := ngcweb

###### TARGETS #########

# Print available options
.PHONY: help 
help:
	 @printf "$$ make                 # defaults to the help target\n"
	 @printf "$$ make help            # print the help message\n"
	 @printf "$$ make image           # builds harmony docker and harmony yaml\n"
	 @printf "$$ make clean           # cleanup\n"

######################

.PHONY: image
image: 
	 @echo " > Building web server for linux docker image"
	 docker build -t ${GKE_REPO}/${DOCKER_NAME}:$(DOCKER_TAG) . --platform linux/amd64
	 docker images  | grep ${DOCKER_NAME}
	 docker push ${GKE_REPO}/${DOCKER_NAME}:$(DOCKER_TAG)

#######################
.PHONY: clean
clean:
	 @echo "> Cleaning the repo"