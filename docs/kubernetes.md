# Kubernetes Notes

If we want to run jobs in k8s this well be useful for testing locally. 


## Steps for initial setup

- [Install docker](https://docs.docker.com/engine/install/)
- [Install minikube](https://minikube.sigs.k8s.io/docs/start/)
- start minikube

```bash
## start
minikube start`
```

> if you get an error `docker: Not healthy: "docker version --format {{.Server.Os}}-{{.Server.Version}}:{{.Server.Platform.Name}}" exit status 1: permission denied while trying to connect to the Docker daemon socket a....`
>
> You need to <https://docs.docker.com/engine/install/linux-postinstall/> and retry.

![](./docs/images/minikube-start.png)

- [Install kubectl](https://kubernetes.io/docs/tasks/tools/)

```bash
# check everything started correctly
kubectl get all -A
```

- [Install helm](https://helm.sh/docs/intro/install/)

- Add the Apache Airflow Helm chart repository:

```bash
helm repo add apache-airflow https://airflow.apache.org
helm upgrade --install airflow apache-airflow/airflow --namespace airflow --create-namespace
```

Install result.

![](/docs/images/helm-install-of-airflow.png)

```bash
## forward port for Airflow webserver URL 
kubectl port-forward svc/airflow-webserver 8080:8080 --namespace airflow

```

> Note!
> `kubectl port-forward` does not return. To continue with the exercises, you will need to open another terminal.
