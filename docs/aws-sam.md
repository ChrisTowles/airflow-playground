# AWS SAM CLI

Install AWS SAM CLI to validate CloudFormation templates.

```bash
cd ~/temp

curl -L https://github.com/aws/aws-sam-cli/releases/latest/download/aws-sam-cli-linux-x86_64.zip -o aws-sam-cli-linux-x86_64.zip
unzip aws-sam-cli-linux-x86_64.zip -d sam-installation
sudo ./sam-installation/install
which sam
sam --version

```

