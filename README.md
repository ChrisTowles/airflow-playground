# Airflow Playground

I built this Repo as part of Proof of Concept for my blog posts:

- <https://chris.towles.dev/blog/apache-airflow-part-1-why-and-goals>

## My goals

I am however going to put a few constraints in place around how I want to use Airflow.

- Can't use [AWS MWAA](https://aws.amazon.com/mwaa/) (it's not offered in AWS US Gov East)
- Local Development
  - Changes to a job must be able to be tested locally before being pushed
- CICD Pipeline
  - Changes to a job must be able to be deployed to production via a CI/CD pipeline.
- Job Management
  - Offer Web UI to view and re-trigger jobs
  - prefer Code first and config rather UI based.
  - Time to modify a job should be less than 5 minutes.
  - Time to create a job should be less than 30 minutes.
- Cost
  - I'd like as close to zero cost as possible, ideally spinning down to near no resource usage when no jobs running.
- Maintenance
  - Would like to be able to deploy new versions of the Airflow container on ECS or EKS
    - This isn't a hard requirement could use an EC2 instance and updated in place but that another box to maintain long term.
      - If instead it was just ECS pointing at an RDS database, you could restore the DB from snapshot and test a deployment before release to production.

## Documents

- [Kubernetes Notes](./docs/kubernetes_notes.md)

## Links

- <https://aws.amazon.com/blogs/containers/running-airflow-on-aws-fargate/>
- <https://airflow.apache.org/docs/docker-stack/build.html>
- MWAA Docker images
  - <https://github.com/aws/amazon-mwaa-docker-images>
- Airflow Triggerer - The Triggerer allows tasks to be paused and resumed
  <https://www.restack.io/docs/airflow-knowledge-airflow-triggerer-guide>
- DBT
  - https://data-dive.com/deploy-dbt-on-aws-using-ecs-fargate-with-airflow-scheduling/
  - https://gitlab.com/snowflakeproto/dbtonawsfargate


## Examples I've reviewed

- <https://github.com/NASA-IMPACT/self-managed-apache-airflow>
  - terraform stack
- <https://github.com/nicor88/aws-ecs-airflow>
- terraform stack
- <https://github.com/andresionek91/airflow-autoscaling-ecs>
  - CloudFormation
- <https://github.com/aelzeiny/airflow-aws-executors>
  - AWS Executor that delegates every task to a scheduled container on either AWS Batch, AWS Fargate, or AWS ECS.

## Setup Python with pyenv

```bash
pyenv install 3.12
pyenv virtualenv 3.12 airflow-playground

# set pyenv to use the new environment
pyenv local airflow-playground
pyenv shell airflow-playground

# show which python is being used
pyenv which python
```

Install the latest pip and dependencies for scripts

```bash
pip install --upgrade pip
pip install -r requirements.txt

```

## Access Airflow UI

- create `.env` from `.env.example`
- `docker compose up airflow-ini` to start airflow with the local provider and sqlite db

