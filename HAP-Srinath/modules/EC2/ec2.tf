#Defining Cloud Provider to orchestrate environment

provider "aws" {
	region = "${var.region}"
	access_key = "${var.access_key}"
	secret_key = "${var.secret_key}"
}

#Creating a new key pair while launching the instance
#1. Generate Public and Private Key using ssh-keygen and save into a file

#resource "aws_key_pair" "hap_ssh" {
#	key_name = "hap_ssh"
#	public_key = "${file("hap-key")}"
#}

#Amazon EC2 instance Launch

resource "aws_instance" "hap_instance" {
	count = "${var.instance_count}"
	ami = "${lookup(var.amis,var.region)}"
	instance_type = "t2.micro"
#	key_name = "${aws_key_pair.hap_ssh.key_name}"
	key_name = "${var.hap_key_name}"
	subnet_id = "${aws_subnet.hap_subnet_public.id}"
	vpc_security_group_ids = ["${aws_security_group.hap_sg_instance.id}"]
	tags {
	Name = "Myrounding_Instance-$(count.index + 1)"
}
root_block_device = {
    volume_type           = "gp2"
    volume_size           = 20
    delete_on_termination = false
  }

}
