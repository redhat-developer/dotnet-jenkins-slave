#!/bin/bash -e
#
# Test the Jenkins image.
#
# IMAGE_NAME specifies the name of the candidate image used for testing.
# The image has to be available before this script is executed.
#

IMAGE_NAME=${IMAGE_NAME:-dotnet/dotnet-21-jenkins-slave-rhel7}

if [ "${DEBUG}" != "" ]; then
  # print commands as they are executed.
  set -x
fi

info() {
  echo -e "\e[1m[INFO] $@\e[0m"
}

info "Testing ${IMAGE_NAME}"

# make sure oc is installed
docker run ${IMAGE_NAME} oc
# make sure dotnet, npm and nodejs are available
# the default entrypoint for the image assumes if you supply more than
# one arg, you are trying to invoke the slave logic, so we have to
# override the entrypoing to run complicated commands for testing.
docker run --entrypoint="/bin/bash" ${IMAGE_NAME} "-c" "dotnet --version"
docker run --entrypoint="/bin/bash" ${IMAGE_NAME} "-c" "npm --version"
docker run --entrypoint="/bin/bash" ${IMAGE_NAME} "-c" "node --version"

info "Testing ${IMAGE_NAME} finished succesfully"