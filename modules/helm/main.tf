resource "helm_release" "my_nginx" {
  name      = "my-nginx"
  namespace = "default"
  chart     = "${path.root}/helm/my-nginx-chart"

  set {
    name  = "service.type"
    value = "LoadBalancer"
  }
}
