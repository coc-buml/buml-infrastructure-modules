# Enabling automatic TLS certificate provisioning

https://knative.dev/docs/serving/using-auto-tls/

Using HTTP-01 challenge

- In this type, your cluster does not need to be able to talk to your DNS server. You just need to map your domain to the IP of the cluser ingress.
- When using HTTP-01 challenge, a certificate will be provisioned per Knative Service. Certificate provision per namespace is not supported when using HTTP-01 challenge.

## Before you begin

You must meet the following prerequisites to enable auto TLS:

**The following must be installed on your Knative cluter:**

- Knative Serving.
- Istio with SDS, version 1.3 or higher, Contour, version 1.1 or higher, or Gloo, version 0.18.16 or higher. Note: Currently, Ambassador is unsupported.
- cert-manager version 0.12.0 or higher.
- Your Knative cluster must be configured to use a custom domain.
- configure your custom domain to map to the IP of ingress. You can achieve this by adding a DNS A record to map the domain to the IP according to the instructions of your DNS provider.
