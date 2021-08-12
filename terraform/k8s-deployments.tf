resource "kubernetes_deployment" "kottam-cicd" {
  metadata {
    name      = "kottam-cicd"
    namespace = var.k8s_namespace
    labels = {
      env = "prod"
    }
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        env = "prod"
      }
    }

    template {
      metadata {
        labels = {
          env = "prod"
        }
      }

      spec {
        container {
          image = "ashishkr99/kottam-cicd:latest"
          name  = "kottam-cicd"

          resources {
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "50Mi"
            }
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "kottam-cicd" {
  metadata {
    name      = "kottam-cicd"
    namespace = var.k8s_namespace
  }

  spec {
    selector = {
      env = "prod"
    }
    port {
      port        = 5000
      target_port = 5000
    }

    type = "LoadBalancer"
  }
}

resource "helm_release" "grafana" {
  name = "grafana"

  repository = "https://charts.bitnami.com/bitnami"
  chart      = "grafana"
  namespace  = var.k8s_namespace

  set {
    name  = "service.type"
    value = "LoadBalancer"
  }

  set {
    name  = "admin.user"
    value = "adminuser"
  }

  set {
    name  = "admin.password"
    value = "password@123"
  }

  set {
    name  = "metrics.enabled"
    value = "true"
  }
}

resource "helm_release" "kube-prometheus" {
  name = "kube-prometheus"

  repository = "https://charts.bitnami.com/bitnami"
  chart      = "kube-prometheus"
  namespace  = var.k8s_namespace

  set {
    name  = "prometheus.service.type"
    value = "LoadBalancer"
  }
}

data "kubernetes_service" "grafana" {
  depends_on = [helm_release.grafana]
  metadata {
    name = "grafana"
  }
}

data "kubernetes_service" "kube-prometheus" {
  depends_on = [helm_release.kube-prometheus]
  metadata {
    name = "kube-prometheus-prometheus"
  }
}