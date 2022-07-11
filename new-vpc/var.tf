variable "public" {
    type = map(string)
    default = {
      "vpc" = "10.0.0.0/16"
      "public1" = "10.0.1.0/24"
      "public2" = "10.0.2.0/24"
      "private1" = "10.0.3.0/24"
      "private2" = "10.0.4.0/24"
      "private3" = "10.0.5.0/24"
    }
}
locals {
  ingress_rules = [
    {   port = 22
        description = "ssh"
    },
       {
        port = 80
        description = "http"
       },
       {
        port = 443
        description = "https"
       }
  ]
}