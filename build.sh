#!/bin/bash -e
# Build Jenkins slave images and run tests.
#
# PRE: Docker daemon running
#
# Supported environment variables:
#
# -----------------------------------------------------
# VERSIONS     The list of versions to build/test.
#              Defaults to all versions. i.e "2.0".
# -----------------------------------------------------
#
# Usage:
#       $ sudo ./build.sh
#       $ sudo VERSIONS=2.0 ./build.sh
#

if [ "${DEBUG}" != "" ]; then
  # print commands as they are executed.
  set -x
fi

script_dir="$(readlink -zf $(dirname "${BASH_SOURCE[0]}"))"

info() {
  echo -e "\e[1m[INFO] $@\e[0m"
}

VERSIONS="${VERSIONS:-2.0}"

function build_image()
{
    local dockerfile="$1"
    local image="$2"
    local context_dir=$(dirname "${dockerfile}")

    info "Building ${image}"
    docker rmi -f "${image}" >/dev/null 2>&1 || true
    docker build -f "${dockerfile}" -t "${image}" "${context_dir}"
    info "Finished building ${image}"
}

for v in ${VERSIONS}; do
    v_no_dot=$(echo ${v} | sed 's/\.//g')
    slave_dir="${script_dir}/${v}"
    image="dotnet/dotnet-${v_no_dot}-jenkins-slave-rhel7"

    # Build image
    build_image "${slave_dir}/Dockerfile.rhel7" ${image}
    # Run tests
    IMAGE_NAME=${image} "${slave_dir}/test.sh"
done