resource "aws_security_group" "mesos-sg" {
  name = "mesos-sg"
  description = "Mesos security group"

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 5050
    to_port = 5050
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 5051
    to_port = 5051
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 2181
    to_port = 2181
    protocol = "tcp"
    self = true     
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "mesos-master" {
  instance_type = "m3.medium"
  ami = "${lookup(var.amis, var.region)}"
  count = 1
  key_name = "${var.key_name}"
  security_groups = ["${aws_security_group.mesos-sg.name}"]
  connection {
    user = "ubuntu"
    key_file = "${var.key_file}"
  }
  provisioner "remote-exec" {
    scripts = [
      "../files/base.sh",
      "../files/mesos-master.sh"
    ]
  }
  provisioner "remote-exec" {
    inline = [
      "echo ${aws_instance.mesos-master.private_ip} zk1 >> /etc/hosts",
      "echo zk://zk1:2181/mesos > /etc/mesos/zk",
      "echo ${aws_instance.mesos-master.private_ip} >> /etc/mesos-master/ip",
      "echo blargl > /etc/mesos-master/cluster",
      "echo 1 > /etc/zookeeper/conf/myid"
    ]
  }
  provisioner "remote-exec" {
    scripts = [
      "../../files/mesos-master-start.sh"
    ]
  }
}

#resource "aws_route53_record" "mesos-master" {
#   zone_id = "${var.zone_id}"
#   name = "${var.mesos_dns}"
#   type = "A"
#   ttl = "300"
#   records = ["${aws_instance.mesos-master.public_ip}"]
#}

resource "aws_instance" "mesos-slave" {
  instance_type = "m3.medium"
  ami = "${lookup(var.amis, var.region)}"
  count = 1
  key_name = "${var.key_name}"
  security_groups = ["${aws_security_group.mesos-sg.name}"]
  connection {
    user = "ubuntu"
    key_file = "${var.key_file}"
  }
  provisioner "remote-exec" {
    scripts = [
      "../files/base.sh",
      "../files/mesos-slave.sh"
    ]
  }
  provisioner "remote-exec" {
    inline = [
      "echo ${aws_instance.mesos-master.private_ip} zk1 >> /etc/hosts",
      "echo zk://zk1:2181/mesos > /etc/mesos/zk",
      "echo ${aws_instance.mesos-master.private_ip} >> /etc/mesos-slave/ip",
    ]
  }
  provisioner "remote-exec" {
    scripts = [
      "../../files/mesos-slave-start.sh"
    ]
  }
}
