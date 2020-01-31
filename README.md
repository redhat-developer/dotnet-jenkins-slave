# dotnet-jenkins-slave

This repository contains Dockerfiles for .NET Core Jenkins slave images intended for 
use with [OpenShift v3](https://github.com/openshift/origin). The base image common to Jenkins
slaves is in the https://github.com/openshift/jenkins repository.

For more information about using these images with OpenShift, please see the
official [OpenShift Documentation](https://docs.openshift.org/latest/using_images/other_images/jenkins.html).

The images are available to be pulled from https://access.redhat.com/containers/#/  
For example the dotnet-22-jenkins-slave-rhel7 image is available at 
https://access.redhat.com/containers/?tab=overview#/registry.access.redhat.com/dotnet/dotnet-22-jenkins-slave-rhel7

## Versions

Jenkins slaves provided:

- [RETIRED] .NET Core 2.0 (RHEL7, CentOS7)
- .NET Core 2.1 (RHEL7)
- [RETIRED] .NET Core 2.2 (RHEL7)
- .NET Core 3.0 (RHEL7)
- .NET Core 3.1 (RHEL7)

## Building

To build and test all versions:

```
$ sudo ./build.sh
```

To build and test specific versions:

```
$ sudo VERSIONS=3.1 ./build.sh
```

Note: to build RHEL 7 based images, you need to run the build on a
properly subscribed RHEL machine. To build CentOS images on RHEL, set
BUILD_CENTOS=true. On non-RHEL, building CentOS images is the default.
