variable "access_key" {}
variable "secret_key" {}
variable "region" {}
variable "key_name" {}
variable "key_file" {}

#variable "zone_id" {}
#variable "mesos_dns" {}

variable "amis" {
    default = {
        us-east-1 = "ami-d25e48b8"  # ubuntu 14.04 lts hvm:instance-store
    }
}

