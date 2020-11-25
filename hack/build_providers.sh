#!/bin/bash

PROVIDERS_PATH=providers_ppc64le/registry.terraform.io
mkdir -p $PROVIDERS_PATH


function clone_build {
  git clone -b v$VERSION https://github.com/$PROVIDER_ORG/$PROVIDER_NAME $GOPATH/src/github.com/$PROVIDER_ORG/$PROVIDER_NAME
  cd $GOPATH/src/github.com/$PROVIDER_ORG/$PROVIDER_NAME
  make build
  mkdir -p $PROVIDERS_PATH/$PROVIDER_ORG/$PROVIDER_NAME/$VERSION/linux_ppc64le
  mv $GOPATH/bin/$PROVIDER_NAME $PROVIDERS_PATH/$PROVIDER_ORG/$PROVIDER_NAME/$VERSION/linux_ppc64le
}

PROVIDER_NAME=terraform-provider-ignition
PROVIDER_ORG=community-terraform-providers
VERSION=2.1.1
clone_build

PROVIDER_NAME=terraform-provider-ignition
PROVIDER_ORG=terraform-providers
VERSION=1.2.1
clone_build

PROVIDER_NAME=terraform-provider-null
PROVIDER_ORG=hashicorp
VERSION=2.1.2
clone_build

PROVIDER_NAME=terraform-provider-random
PROVIDER_ORG=hashicorp
VERSION=2.3.1
clone_build

PROVIDER_NAME=terraform-provider-openstack
PROVIDER_ORG=terraform-provider-openstack
VERSION=v1.32.0
clone_build

PROVIDER_NAME=terraform-provider-ibm
PROVIDER_ORG=IBM-Cloud
VERSION=v1.13.1
clone_build


zip archive.zip providers_ppc64le
