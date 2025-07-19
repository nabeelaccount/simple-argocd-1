# Simple demontration on the use of ArgoCD

ArgoCD is a Continous Delivery (CD) tool which monitors an ops git repository for any changes to its image tags/version. Once a change is detected, ArgoCD will apply the change to the cluster.

## Getting started

Ensure you have a running Kubernetes cluster. The changes demonstrated here are based on running a single Kubernetes node using Docker Desktop. 

Install ArgoCD

The simplies way to install [ArgoCD](https://artifacthub.io/packages/helm/argo/argo-cd) is using the community based ArgoCD Helm Chart.

For a simple declaritive approach, we deploy the Helm package using Terraform. Please navigate to the `Terraform` folder and run the following:

```sh
terraform apply
```

Approve the changes if they meet your requirements.

Extract the initial ArgoCD password
```sh
kubectl get secrets -n argocd argocd-initial-admin-secret -o jsonpath='{.data.password}' | base64 --decod
```
Use this password alongside the user `admin` as the intial credentials for ArgoCD

Port-forward to ArgoCD console
```sh
kubectl -n argocd port-forward svc/argocd-server 8080:80
```

Now access the console on your browser on `localhost:8080`
