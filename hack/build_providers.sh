#!/bin/bash

ARCHIVE_FILE=$1
[[ -z $ARCHIVE_FILE ]] && ARCHIVE_FILE=/tmp/archive.zip

PROVIDERS_PATH=/tmp/providers_ppc64le
REGISTRY_PATH=$PROVIDERS_PATH/registry.terraform.io
mkdir -p $REGISTRY_PATH


function clone_build {
  git clone -b v$VERSION https://github.com/$PROVIDER_ORG/terraform-provider-$PROVIDER_NAME $GOPATH/src/github.com/$PROVIDER_ORG/terraform-provider-$PROVIDER_NAME
  cd $GOPATH/src/github.com/$PROVIDER_ORG/terraform-provider-$PROVIDER_NAME
  make build
  mkdir -p $REGISTRY_PATH/$PROVIDER_ORG/$PROVIDER_NAME/$VERSION/linux_ppc64le
  mv $GOPATH/bin/terraform-provider-$PROVIDER_NAME $REGISTRY_PATH/$PROVIDER_ORG/$PROVIDER_NAME/$VERSION/linux_ppc64le
}

PROVIDER_NAME=ignition
PROVIDER_ORG=community-terraform-providers
VERSION=2.1.2
clone_build

PROVIDER_NAME=ignition
PROVIDER_ORG=terraform-providers
VERSION=2.1.2
clone_build

PROVIDER_NAME=null
PROVIDER_ORG=hashicorp
VERSION=3.1.0
clone_build

PROVIDER_NAME=random
PROVIDER_ORG=hashicorp
VERSION=3.1.0
clone_build

PROVIDER_NAME=openstack
PROVIDER_ORG=terraform-provider-openstack
VERSION=1.44.0
clone_build

PROVIDER_NAME=ibm
PROVIDER_ORG=IBM-Cloud
VERSION=1.33.1
clone_build

cd $PROVIDERS_PATH
zip -r $ARCHIVE_FILE ./
