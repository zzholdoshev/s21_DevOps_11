# Kubernetes

## Kubernetes distributions

When setting up a Kubernetes environment, there are two options: Vanilla Kubernetes and Managed Kubernetes. With Vanilla Kubernetes, the software team must spool the Kubernetes source code and compile the environment on the machine. Managed Kubernetes, on the other hand, comes pre-compiled and pre-configured, with additional tools that improve or add new features to the Kubernetes environment, such as storage, security, deployment, monitoring, etc. Managed Kubernetes are also known as Kubernetes distributions.

Some Kubernetes distributions are specifically designed to use fewer resources, such as **Minikube** and **k3s**.

Two factors - low resource requirements and ease of use - make lightweighted Kubernetes distributions a great choice for people who are unfamiliar with Kubernetes and want to set up an environment on their own computer where they can experiment. 

### Minikube

Minikube is a simplified Kubernetes distribution developed as part of the main Kubernetes project. It can run on Linux, Windows, and macOS (although if you run it outside of a Linux environment, it uses virtualization to set up your clusters; on Linux, you can use virtualization or run clusters directly on bare hardware).

By default Minikube creates a cluster of one node, but you can set up more nodes by using the `--nodes` flag when you run Minikube.

The main advantages of the Minikube are that it is extremely lightweight and very easy to install and use.

The main disadvantage of Minikube is that it is intended only for testing. It is not a practical solution for running production-level clusters.

### k3s

K3s is a simplified Kubernetes distribution developed by Rancher. It can also run on any operating system (Linux, Windows and macOS).

It's relatively easy to set up a single-node cluster. You simply download a binary from GitHub and run the single-node cluster with the command:

`sudo server k3s`

However, if you want to add nodes to your cluster, you need to configure k3s on them separately and join them to your cluster. K3s is a bit more difficult to use than Minikube, which provides a much simpler process for adding nodes.

On the other hand, k3s is designed as a complete, production-ready Kubernetes distribution that is also lightweight. Rancher designed it specifically for use cases involving infrastructures such as the Internet of Things (IoT) and peripherals.

## Creating your own k3s cluster

The proposed cluster will consist of 3 nodes - 2 workers and 1 master node. It is important to remember that when installing k3s on the system worker nodes, it is also required to pass the master node address and a special token confirming the worker's access to the system.

### Ingress controller

The k3s system comes pre-installed with an Ingress controller, for accessing the system from the outside, but it is not necessary to use it. An alternative solution could be Nginx, which has all the necessary tools to make the cluster accessible.

The Nginx ingress controller already exists in a ready-made form, because in case of using standard Nginx there will be no logic to rebuild the controller and you will have to "manually" change parameters to access new services externally.

Note that functionally the standard Ingress controller does not differ from the Nginx one, i.e. it is not necessary to change the configuration of the system components.

### PV, PVC data storage

Persistent volumes is an important part of the entire Kubernetes system infrastructure. It allows not only flexible storage management for services, but also comfortable management with the PV controller (PVC) - the amount of resources spent, access rights, expansion and contraction of used volumes, as well as backups configuration with developed solutions from the Kubernetes community.

### Security

To ensure security, tools were first developed to create internal data networks that can be isolated from each other. The main goal is not only to protect the system from third-party intruders, but also to support the system's software product development process in order to avoid using "workarounds" to access the system's core services directly.

Usually, network restrictions are set at the namespace level. This means that for each namespace, it is suggested to allocate an isolated network, and then to make some system components available in other networks as well. 

In addition to the networking problem, there is the problem of administering access data (tokens, certificates, passwords). Again, in addition to isolation from the risks of such sensitive data being obtained by intruders, there are risks of interference from within. For example, many well-known companies have experienced theft of access to third-party services and unfair use of obtained data not so long ago. 

Kubernetes also offered to centralize access to such data with Secrets Managment. This tool is somewhat similar to how PV and PVC work, but not only provides access to secrets, it also collects information about how they are used, and integrates the process of obtaining secrets into Deployment. So, when deploying a service where a secret is needed, without the value obtained, the service will not even start.

### Cert-manager

Cert-manager is a utility for automatic certificate management in Kubernetes. It allows you to simplify and automate the process of generating, issuing and updating TLS (Transport Layer Security) certificates in Kubernetes cluster. Cert-manager supports different certificate providers, including Let's Encrypt, Venafi and HashiCorp Vault. It can be configured to automatically generate certificates for Kubernetes applications based on Kubernetes resources, such as Ingress, and to automatically update certificates when they expire. Cert-manager also provides integration with Kubernetes orchestrator and its API, which facilitates certificate management in Kubernetes.

### Operators

The purpose of the Operator is to provide the user with an API that allows to manage multiple entities of a stateful application in a Kubernetes cluster without having to think about what is under the hood (what data and what to do with it, what commands still need to be executed to maintain the cluster). In fact, Operator is designed to simplify the work with the application within the cluster as much as possible, automating the performance of operational tasks that previously had to be done manually.

For example, the Prometheus operator provides its own Kubernetes deployment and management of Prometheus and related monitoring components. The goal of this project is to simplify and automate the configuration of the Prometheus-based monitoring stack for Kubernetes clusters.

So, if an automated deployment of a multi-component service or stack is needed, operators should be used to monitor the deployment and operation of such systems independently.
