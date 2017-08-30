# dotnet-jenkins-slave

This repository contains Dockerfiles for .NET Core Jenkins slave images intended for 
use with [OpenShift v3](https://github.com/openshift/origin). The base image common to Jenkins
slaves is in the https://github.com/openshift/jenkins repository.

For more information about using these images with OpenShift, please see the
official [OpenShift Documentation](https://docs.openshift.org/latest/using_images/other_images/jenkins.html).

## Versions

Jenkins slaves provided for RHEL7:

- .NET Core 2.0

## Building

To build and test all versions:

```
$ sudo ./build.sh
```

To build and test specific versions:

```
$ sudo VERSIONS=2.0 ./build.sh
```