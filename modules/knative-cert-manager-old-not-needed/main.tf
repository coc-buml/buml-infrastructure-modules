# Knative installation

resource "null_resource" "knative_monitoring" {
  # Changes to any instance of the cluster requires re-provisioning
  # triggers = {
  #   cluster_instance_ids = "${join(",", aws_instance.cluster.*.id)}"
  # }

  #
  # Init CLI
  #

  # install cli 
  provisioner "local-exec" {
    command = "az aks install-cli"
  }

  # get credentials for cli 
  provisioner "local-exec" {
    command = "az aks get-credentials --resource-group ${var.resource_group_name} --name ${var.cluster_name}"
  }

  # 
  # Install Cert Manager
  #

  # Install the Custom Resource Definitions (aka CRDs):
    provisioner "local-exec" {
    command = "kubectl apply --validate=false -f https://github.com/jetstack/cert-manager/releases/download/v${var.cert_manager_version}/cert-manager.yaml"
  }                                    


  # Check installation

    provisioner "local-exec" {
      command = "kubectl get pods --namespace cert-manager"
  }

    # ClusterIssuer for HTTP-01 challenge 
    provisioner "local-exec" {
      command = "kubectl apply -f - ${var.lets_encrypt_issuer}"
  }
 
    # Install networking-certmanager deployment

    provisioner "local-exec" {
      command = "kubectl get deployment networking-certmanager -n knative-serving"
  }

     # ClusterIssuer for HTTP-01 challenge 
    provisioner "local-exec" {
      command = "kubectl apply --filename https://github.com/knative/net-certmanager/releases/download/v${var.knative_serving_version}/release.yaml"
  }

     # ClusterIssuer for HTTP-01 challenge 
    provisioner "local-exec" {
      command = "kubectl get deployment networking-ns-cert -n knative-serving"
  }

  # Install networking-ns-cert component 
    provisioner "local-exec" {
      command = "kubectl apply --filename https://github.com/knative/serving/releases/download/v${var.knative_serving_version}/serving-nscert.yaml"
  }
 
   # Install networking-ns-cert component 
    provisioner "local-exec" {
      command = "kubectl apply -f - ${var.config_certmanager}"
  }

  # Turn on Auto TLS 
    provisioner "local-exec" {
      command = "kubectl patch configmap config-network --namespace knative-serving --type merge --patch '{\"data\":{\"autoTLS\": \"Enabled\", \"httpProtocol\":\"Redirected\"}}'"
  }


}
# kubectl edit configmap config-certmanager --namespace knative-serving

# kubectl patch configmap config-network --namespace knative-serving --type merge --patch '{"data":{"autoTLS": "Enabled", "httpProtocol":"Enabled"}}'




# kubectl apply --selector knative.dev/crd-install=true \
#    --filename https://github.com/knative/serving/releases/download/${KNATIVE_VERSION}/serving.yaml \
#    --filename https://github.com/knative/eventing/releases/download/${KNATIVE_VERSION}/release.yaml \
#    --filename https://github.com/knative/serving/releases/download/${KNATIVE_VERSION}/monitoring.yaml
# kubectl apply \
#    --filename https://github.com/knative/serving/releases/download/${KNATIVE_VERSION}/serving.yaml \
#    --filename https://github.com/knative/eventing/releases/download/${KNATIVE_VERSION}/release.yaml \
#    --filename https://github.com/knative/serving/releases/download/${KNATIVE_VERSION}/monitoring.yaml
# sleep 60