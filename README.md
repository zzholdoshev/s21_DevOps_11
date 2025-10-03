# Advanced Kubernetes

💡 [Tap here](https://new.oprosso.net/p/4cb31ec3f47a4596bc758ea1861fb624) **to leave your feedback on the project**. It's anonymous and will help our team make your educational experience better. We recommend completing the survey immediately after the project.

## Contents

1. [Chapter I](#chapter-i) 
2. [Chapter II](#chapter-ii) \
   2.1. [Deploying your own k3s cluster](#part-1-deploying-your-own-k3s-cluster) \

## Chapter I

There are many other orchestration tools besides docker swarm. One of the most popular solutions is the Kubernetes tool developed by Google. The main difference of kubernetes is the higher complexity and scale of the solution. Kubernetes is mostly for more serious applications, with a large number of services and complex interactions. Kubernetes also has a number of additional built-in tools, such as an internal monitoring system.

## Chapter II

The result of the work must be a report with detailed descriptions of the implementation of each of the points with screenshots. The report is prepared as a markdown file in the `src` directory named `REPORT.MD`.

## Part 1. Deploying your own k3s cluster

**== Task ==**

1) Get a set of virtual machines for the cluster

2) Install k3s on all three machines. When installing, do not use the standard Ingress Controller by using the flag `--disable=traefik`.

3) Connect the nodes to the cluster using the `k3s server` command and the `-token` and `--server` flags for worker and master nodes respectively. When k3s is installed, the environment variable `NODE_TOKEN` can be used.

4) Install the Ingress Controller Nginx instead of the default one. You can use the official nginx-based ingress controller manifest file available on GitHub.

5) Get a domain name and configure the `cert-manager` utility inside the cluster, which should generate a wildcard certificate for the obtained domain

6) Create an Ingress resource for your personal domain and configure it to use the nginx ingress controller and the obtained certificate

7) Create a PV (Persistent Volume) for the PostgreSQL database in the manifest from the tenth project.

8) Run the application described in the manifest.

9) Run postman functional tests and make sure that the application works.

10) Install and run Prometheus Operator to collect metrics in the system. Add the result of the `kubectl get pods -n monitoring`command in the report
