variable resource_group_name {
  description = "name of the resource group to deploy AKS cluster in"
}

variable cluster_name {
  description = "AKS cluster name"
}

variable cert_manager_version {
  description = "Version of cert manager which will be installed"
}

variable knative_serving_version {
  description = "Version of Knative serving which will be installed"
}


variable lets_encrypt_issuer {
  default = <<EOF
apiVersion: cert-manager.io/v1alpha2
kind: ClusterIssuer
metadata:
  name: letsencrypt-http01-issuer
spec:
  acme:
    privateKeySecretRef:
      name: letsencrypt
    server: https://acme-v02.api.letsencrypt.org/directory
    solvers:
    - http01:
       ingress:
         class: istio
EOF
}

variable config_certmanager {
  default = <<EOF
apiVersion: v1
kind: ConfigMap
metadata:
  name: config-certmanager
  namespace: knative-serving
  labels:
    networking.knative.dev/certificate-provider: cert-manager
data:
  issuerRef: |
    kind: ClusterIssuer
    name: letsencrypt-http01-issuer
EOF
}



