# About The Project

This is my personal project that I use to set up the infrastrucure at Hetzner to host my personal website. 
The project sets up required server(s) and puts in place proper security measures, such as allowing login to the server only with an SSH key.

The project also utilizes Devcontainers, meaning having only Docker installed with VSCode and Dev Containers extension, one has everything needed.
However, as I use 1Password as my personal password and secret manager. The instructions and code reflect that.

## Getting Started

This project assumes the use of VSCode with Dev Containers extensions and having Docker (or Podman if configured properly) installed and 

### Prerequisites

1. VSCode with Dev Containers extension
2. Docker (or Podman if properly configured in VSCode)
3. Service Account created in 1Password with access to required secrets and the token available

### Installation

1. Clone the repo with `git clone https://github.com/nikokultalahti/personal-cloud-infra-hetzner.git`
2. Open the folder in VSCode and reopen it in a Dev Container
3. Change references in `.env` file to point to your correct values/secrets in your 1Password vault
4. Change user and public key key in `user_data.yaml` file

## Usage

1. Create a new project in Hetzner
2. Create an API key for the project and save it in 1Password
3. Add 1Password Service Account to the environment
```
export OP_SERVICE_ACCOUNT_TOKEN=<<Your OP_SERVICE_ACCOUNT_TOKEN>>

```
4. Run `terraform init` to initialize terraform
5. Run `op run --env-file=.env terraform plan` to check things work as intended and see what would get created
6. Create infra by running `op run --env-file=.env terraform plan`

## Contact

- Niko Kultalahti, hello@nikokultalahti.com