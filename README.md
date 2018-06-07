# dotnet-jenkins-slave

This repository contains Dockerfiles for .NET Core Jenkins slave images intended for 
use with [OpenShift v3](https://github.com/openshift/origin). The base image common to Jenkins
slaves is in the https://github.com/openshift/jenkins repository.

For more information about using these images with OpenShift, please see the
official [OpenShift Documentation](https://docs.openshift.org/latest/using_images/other_images/jenkins.html).

## Versions

Jenkins slaves provided:

- .NET Core 2.0 (RHEL7, CentOS7)
- .NET Core 2.1 (RHEL7)

## Building

To build and test all versions:

```
$ sudo ./build.sh
```

To build and test specific versions:

```
$ sudo VERSIONS=2.0 ./build.sh
```

Note: to build RHEL 7 based images, you need to run the build on a
properly subscribed RHEL machine. To build CentOS images on RHEL, set
BUILD_CENTOS=true. On non-RHEL, building CentOS images is the default.
