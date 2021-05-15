# BNDigital Helm Charts library

Charts used by [bndigital.co](https://bndigital.co) to launch NodeJS-fullstack applications on Kubernetes cluster using Helm.

Add repository

```shell
helm repo add bndigital https://dcr.bndigital.dev/chartrepo/library
helm install my-release bndigital/<chart>
```

## NodeJS

This chart bootstraps a Node deployment on a Kubernetes cluster using the Helm package manager.

### Prerequisites 

#### Required 

- Kubernetes 1.16+ 
- Helm 3.0+ 

#### Optional 

- PV provisioner
- Ingress Controller
- Prometheus Operator

### Parameters 

The following table lists the configurable parameters of the Node chart and their default values.

#### Common Parameters

| Parameter | Description | Default |
| --- | ----------- | ------------- |
| nameOverride | String to partially override node.fullname template | "" |

#### Application

| Parameter | Description | Default |
| --- | ----------- | ------------- |
| app.name | Application name | nodejs | 
| app.port | Port where the application will be running | 5000 | 
| app.workingDir | Port where the application will be running | 5000 | 
