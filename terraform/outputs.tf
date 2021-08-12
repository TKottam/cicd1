output "kottam-cicd" {
  value = "${kubernetes_service.kottam-cicd.status[0].load_balancer[0].ingress[0].hostname}:${kubernetes_service.kottam-cicd.spec[0].port[0].port}"
}

output "grafana" {
  value = "${data.kubernetes_service.grafana.status[0].load_balancer[0].ingress[0].hostname}:${data.kubernetes_service.grafana.spec[0].port[0].port}"
}

output "kube-prometheus" {
  value = "${data.kubernetes_service.kube-prometheus.status[0].load_balancer[0].ingress[0].hostname}:${data.kubernetes_service.kube-prometheus.spec[0].port[0].port}"
}