# About The Project

This is my personal project that I use to set up the infrastrucure at Hetzner with **Terraform** to host my website and services. The project sets up required server(s) and firewalls and puts in place proper security measures on the server.

The project also utilizes devcontainers. This means having only VSCode with Dev Containers extension and 
Docker (or Podman with some additional VSCode configuration) installed, one has everything needed to run the project.

## Features

- Using devcontainers for quick start and having everything needed to start developing/run the project
- Configuration that requires minimal changes to only one file in order to run successfully
- An example of such configuration file
- Sensible defaults (see `variables.tf`) unless overriden
    - Smallest Hetzner Intel vCPU 
    - Ubuntu 22.04 image
    - Defaulting location to Finland
- Update and harden the server
    - Setup Hetzner firewall allowing necessary inbound connections for Coolify (including ports 80 and 443)
    - Setup fail2ban to the server
    - Harden SSH configuration

## Getting Started

This project assumes the use of VSCode with Devcontainers extension.

### Prerequisites

1. VSCode with Dev Containers extension
2. Docker (or Podman if properly configured in VSCode) installed
3. Have a project in Hetzer Cloud and API token for said project available

### Installation

1. Clone the repo with `git clone https://github.com/nikokultalahti/web-infra-hetzner.git`
2. Open the folder in VSCode and (re)open it in a Dev Container
3. Rename the `.terraform.tfvars.example` file to `.terraform.tfvars`
4. Set the required variables in ``.terraform.tfvars`file
5. Change user and public key key in `user_data.yaml` file

### Usage

1. Run `terraform init` to initialize terraform
2. Run `terraform plan`to check things work as intended and see what would get created
3. Create infrastructure by running `terraform apply`
4. After deploying the infra, you should be able to SSH using the username and key you specified via (non-default) port 1111

## Contact

- Niko Kultalahti, hello@nikokultalahti.com