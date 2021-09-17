# BNDigital Helm Charts library

Charts used by [bndigital.co](https://bndigital.co) to launch NodeJS-fullstack applications on Kubernetes cluster using Helm.

Add repository

```shell
helm repo add bndigital https://dcr.bndigital.dev/chartrepo/library
helm install my-release bndigital/<chart>
```

## App

This chart bootstraps a web app deployment on a Kubernetes cluster using the Helm package manager.

### Prerequisites 

#### Required 

- Kubernetes 1.16+ 
- Helm 3.0+ 

#### Optional 

- PV provisioner (in case you need persistence volume claim for you application)
- Cert Manager (in case you want to terminate SSL with LetsEncrypt for your ingress)

### Parameters 

See [Chart](charts/app) for more details.
