# Introduction

Generates an archive of all the required providers plugins for running the [Terraform Automation Projects](#terraform-automation-projects) on IBM Power systems.

### Terraform Automation Projects

Below projects can be run on Power systems by following the [Instructions](#instructions).

[1] [https://github.com/ocp-power-automation/ocp4-upi-powervs/](https://github.com/ocp-power-automation/ocp4-upi-powervs/)

[2] [https://github.com/ocp-power-automation/ocp4-upi-powervm/](https://github.com/ocp-power-automation/ocp4-upi-powervm/)

### List of Terraform Providers

This table shows which Terraform provider plugins are compiled and distributed in archive.zip for `linux/ppc64le` as part of latest [release](../../releases).

Provider versions:
|Provider Name| Github repo|Version|OS/Arch|
|-------------|------------|-------|-------|
|null|https://github.com/hashicorp/terraform-provider-null|v3.1.2|linux/ppc64le|
|random|https://github.com/hashicorp/terraform-provider-random|v3.4.3|linux/ppc64le|
|ignition|https://github.com/terraform-providers/terraform-provider-ignition|v1.2.1|linux/ppc64le|
|ignition|https://github.com/community-terraform-providers/terraform-provider-ignition|v2.1.3|linux/ppc64le|
|openstack|https://github.com/terraform-provider-openstack/terraform-provider-openstack|v1.32.0|linux/ppc64le|
|ibm|https://github.com/IBM-Cloud/terraform-provider-ibm|v1.60.0|linux/ppc64le|
|ibm|https://github.com/hashicorp/terraform-provider-time|v0.10.0|linux/ppc64le|


# Instructions

1. Clone the required branch from one of the [Terraform Automation Projects](#terraform-automation-projects) on your Power system.

Example:
```
git clone https://github.com/ocp-power-automation/ocp4-upi-powervm --branch <branch_name>
cd ocp4-upi-powervm/
```

2. Download the required version of Terraform binary for IBM Power from https://oplab9.parqtec.unicamp.br/pub/ppc64el/terraform/.
```
curl -L https://oplab9.parqtec.unicamp.br/pub/ppc64el/terraform/terraform-<version> -o /usr/bin/terraform
chmod +x /usr/bin/terraform
```

3. Download and extract the required version of archive.zip from [releases page](../../releases).
```
curl -L https://github.com/ocp-power-automation/terraform-providers-power/releases/download/<release_version>/archive.zip -o archive.zip
unzip archive.zip
```

4. Validate that the plugins are present in the current directory.
```
ls -lrt registry.terraform.io/
```

5. Run the terraform init command to use the plugins downloaded locally.
```
terraform init --plugin-dir ./
```

Congratulations! Now you can run the terraform commands to create your cluster from a Power machine. Please refer to the README of [Terraform Automation Projects](#terraform-automation-projects) for further information.
