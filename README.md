# Introduction

Generates an archive of all the required providers plugins for running the [Terraform automation](#terraform-automation) projects on IBM Power systems.

### Terraform automation

Following projects can be run on Power systems when you complete the steps in [How to use](#how-to-use).

[1] [https://github.com/ocp-power-automation/ocp4-upi-powervs/](https://github.com/ocp-power-automation/ocp4-upi-powervs/)

[2] [https://github.com/ocp-power-automation/ocp4-upi-powervm/](https://github.com/ocp-power-automation/ocp4-upi-powervm/)

### Providers and version

This table shows which Terraform provider plugins are compiled and distributed in archive.zip.

|Provider Name| Github repo|Version|OS_Arch|
|-------------|------------|-------|-------|
|null|https://github.com/hashicorp/terraform-provider-null|v2.1.2|linux_ppc64le|
|random|https://github.com/hashicorp/terraform-provider-random|v2.3.1|linux_ppc64le|
|ignition|https://github.com/terraform-providers/terraform-provider-ignition|v1.2.1|linux_ppc64le|
|ignition|https://github.com/community-terraform-providers/terraform-provider-ignition|v2.1.2|linux_ppc64le|
|openstack|https://github.com/terraform-provider-openstack/terraform-provider-openstack|v1.32.0|linux_ppc64le|
|ibm|https://github.com/IBM-Cloud/terraform-provider-ibm|v1.15.0|linux_ppc64le|



# How to use

Ensure you have downloaded OR cloned the code from one of the [Terraform automation](#terraform-automation) project.

```
git clone https://github.com/ocp-power-automation/ocp4-upi-powervm
```

Change to the Terraform auomtation directory.
```
cd ocp4-upi-powervm/
```

Download the latest Terraform binary for IBM Power from https://oplab9.parqtec.unicamp.br/pub/ppc64el/terraform/latest/.
```
curl -L https://oplab9.parqtec.unicamp.br/pub/ppc64el/terraform/latest/terraform-0.14.5 -o /usr/bin/terraform && chmod +x /usr/bin/terraform
```
Download the latest archive.zip from [releases page](../../releases) on you Power system from where you will be running the Terraform automation.
```
curl -L https://github.com/ocp-power-automation/terraform-providers-power/releases/download/v0.7/archive.zip -o archive.zip
```
Extract the archive.zip downloaded in the previous step.
```
unzip archive.zip
```
Validate that the plugins are present in the current directory.
```
ls -lrt registry.terraform.io/
```
Run the terraform init command to use the local plugins.
```
terraform init --plugin-dir ./
```
Congratulations! Now you can run the terraform commands to create your cluster from a Power machine. Please refer to the README of [Terraform automation](#terraform-automation) projects.
