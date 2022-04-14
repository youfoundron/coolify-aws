# Coolify Setup w/ AWS
How to run your own personal Coolify instance on AWS.

## What is Coolify?
Coolify is an an open-source & self-hostable Heroku / Netlify alternative.  
Learn more about it at [coolify.io](https://coolify.io/).

## Prerequisites
You setup Coolify with AWS you will need:
* The [Terraform CLI](https://learn.hashicorp.com/tutorials/terraform/install-cli?in=terraform/aws-get-started) (0.14.9+) installed.
* The [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html) installed.
* [AWS acount](https://aws.amazon.com/free) and [associated credentials](https://docs.aws.amazon.com/general/latest/gr/aws-sec-cred-types.html) that allow you to create resources.
* The [`direnv`](https://direnv.net/docs/installation.html) shell extension installed.
* A previously generated [SSH Public Key](https://git-scm.com/book/en/v2/Git-on-the-Server-Generating-Your-SSH-Public-Key).

## Environment Variables
To provision resources on AWS you'll need some environment variables set on your shell.  

1. Copy the `.envrc.example` file into `.envrc`:
    ```bash
    $ cp .envrc.example .envrc
    ```

2. Edit `.envrc` file with the appropriate variables:
    ```bash
    export AWS_ACCESS_KEY_ID="<YOUR_AWS_ACCESS_KEY_ID>"
    export AWS_SECRET_ACCESS_KEY="<YOUR_AWS_SECRET_ACCESS_KEY>"
    export TF_VAR_aws_region="<YOUR_DEFAULT_AWS_REGION>"
    export TF_VAR_your_ssh_key="<YOUR_SSH_KEY>"
    ```

3. Load the new variables into your shell:
    ```bash
    $ direnv allow
    ```

## Setup
We'll use terraform to spin up our AWS infrastructure.

1. Set unknown variables and install any missing providers:
    ```bash
    $ cd ./terraform
    $ terraform init
    ```

2. Make sure the infrastructure setup plan is good to execute:
    ```bash
    $ terraform plan
    ```

3. Apply the infrastructure changes:
    ```bash
    $ terraform apply
    ```

4. Check your logs, something like:
    ```bash
    coolify_server_instance_id = "i-xxxxxxxxxxxxxxxxx"
    coolify_server_instance_public_dns = "ec2-x-xx-xxx-xxx.compute-1.amazonaws.com"
    coolify_server_instance_public_ip = "x.xx.xxx.xxx"
    ```

## Nice job!
Visit your Coolify instance's public DNS at port 3000, something like `http://ec2-x-xx-xxx-xxx.compute-1.amazonaws.com:3000`