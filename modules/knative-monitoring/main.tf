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
    command = "kubectl apply --filename https://github.com/knative/serving/releases/download/v${var.knative_monitoring_version}/monitoring-core.yaml"
  }                                    


  # Install Prometheus and Grafana for metrics:

    provisioner "local-exec" {
      command = "kubectl apply --filename https://github.com/knative/serving/releases/download/v${var.knative_monitoring_version}/monitoring-metrics-prometheus.yaml"
  }
 


}