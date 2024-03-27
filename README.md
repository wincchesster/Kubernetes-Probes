# Kubernetes Probes: Implementing Health Checks

This guide outlines a hands-on approach to leveraging Kubernetes probes for container health checks, ensuring high availability and reliability of services within a Kubernetes cluster. Through this lesson, you'll learn to create and configure Docker images, deploy them to a private Docker Hub, and utilize different types of probes in Kubernetes to manage container lifecycle effectively.

### Overview

Kubernetes probes are crucial for monitoring container health and automating recovery in case of failures. This project demonstrates the use of three types of probes:

**LivenessProbe**: Checks if the container is alive by sending an HTTP GET request to the specified path and port. If the probe fails, the container is restarted.

**StartupProbe**: Checks if the container is ready to accept traffic. It is used to delay the startup of the container until the probe succeeds.

**ReadinessProbe**: Checks if the container is ready to serve traffic. If the probe fails, the container will not receive traffic.

### Prerequisites

Docker
Kubernetes cluster (Kind, Minikube, EKS, GKE, AKS, etc.)
kubectl configured to communicate with your cluster

## Step-by-Step Guide

### 1. Creating and Pushing the Docker Image

- **Dockerfile**: Prepares a Python-based web server.
- **Web Server** (web.py): A simple server that responds differently based on file presence in the container's file system.

**Build and Push the Docker Image:**

```bash
docker build -t <your_username>/healthchecker:latest .
docker push <your_username>/healthchecker:latest
```

### 2. Configuring Kubernetes Probes

Define your deployment in `deployment.yaml`, specifying the liveness, readiness, and startup probes.

- **LivenessProbe**: Confirms the web server is responsive.
- **ReadinessProbe**: Uses an exec command to check for the existence of /web.py.
- **StartupProbe**: Ensures the web server's custom health endpoint is reachable.

### 3. Exposing the Deployment

Create a `service.yaml` to expose the deployment through a Service, making it accessible within your cluster or externally.

### 4. Applying the Configuration

Apply the configurations with kubectl, ensuring you have the necessary persistent volumes (PV) and persistent volume claims (PVC) set up:

```bash
kubectl apply -f pv.yaml
kubectl apply -f pvc.yaml
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
```

### 5. Observing Probe Behavior

Experiment by adding or removing files from the mounted volume and observe how the Kubernetes probes react, ensuring high availability of your service.

## Conclusion

This project provides a practical introduction to Kubernetes probes, illustrating their importance in maintaining service health and availability. By following through, you'll gain hands-on experience in deploying and managing applications on Kubernetes, reinforcing your skills in container orchestration.
