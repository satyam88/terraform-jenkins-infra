variable "region" {
  type = string
}
variable "environment" {
  default = "Development"
  type    = string
}

variable "instance_type" {
  type = string
}

variable "keyname" {
  type = string
}
