variable "access_key" {}
variable "secret_key" {}
variable "region" {}
variable "key_name" {}
variable "key_file" {}

#variable "zone_id" {}
#variable "mesos_dns" {}

variable "amis" {
    default = {
        us-east-1 = "ami-8ceef9e6"
    }
}

