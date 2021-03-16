# Introduction

Generates an archive of all the required providers plugins for running the [Terraform Automation Projects](#terraform-automation-projects) on IBM Power systems.

### Terraform Automation Projects

Below projects can be run on Power systems by following the [Instructions](#instructions).

[1] [https://github.com/ocp-power-automation/ocp4-upi-powervs/](https://github.com/ocp-power-automation/ocp4-upi-powervs/)

[2] [https://github.com/ocp-power-automation/ocp4-upi-powervm/](https://github.com/ocp-power-automation/ocp4-upi-powervm/)

### List of Terraform Providers

This table shows which Terraform provider plugins are compiled and distributed in archive.zip for `linux_ppc64le`. The [releases page](../../releases) will have the version information for each provider.

|Provider Name| Github repo|
|-------------|------------|
|null|https://github.com/hashicorp/terraform-provider-null|
|random|https://github.com/hashicorp/terraform-provider-random|
|ignition|https://github.com/terraform-providers/terraform-provider-ignition|
|ignition|https://github.com/community-terraform-providers/terraform-provider-ignition|
|openstack|https://github.com/terraform-provider-openstack/terraform-provider-openstack|
|ibm|https://github.com/IBM-Cloud/terraform-provider-ibm|



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
