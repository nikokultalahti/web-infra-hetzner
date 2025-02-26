1. Create project in Hetzner
2. Get API Key for the project and save it in 1Password
3. Login in to 1Password CLI with Service Account
4. run `cd infra` and after that run `op run --env-file=.env terraform plan`