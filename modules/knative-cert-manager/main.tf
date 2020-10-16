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
  # Install Knative
  #

  # Install the Custom Resource Definitions (aka CRDs):
    provisioner "local-exec" {
    command = "kubectl apply --validate=false -f https://github.com/jetstack/cert-manager/releases/download/v${var.cert_manager_version}/cert-manager.yaml"
  }                                    


  # Install Prometheus and Grafana for metrics:

    provisioner "local-exec" {
      command = "kubectl get pods --namespace cert-manager"
  }
 

}