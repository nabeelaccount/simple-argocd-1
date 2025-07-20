# Create an app-of-apps ArgoCD pattern

In this example we apply the app of apps pattern of ArgoCD where one ArgoCD application will point to many other ArgoCD application acting as a controller and removing the need to create an ArgoCD application for every application in this folder.

The relationship is as follows:
```sh
Centralised ArgoCD application for many other applications
```