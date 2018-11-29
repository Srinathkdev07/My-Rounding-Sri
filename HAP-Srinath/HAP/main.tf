#module creation for HAP VPC

module "hap_vpc" {
	source = "/vpc"		#Provide the git url of hap template

	vpc_cidr = "192.168.0.0/16"
	public_subnet = "192.168.1.0/24"
	private_subnet = "192.168.2.0/24"
}

module "hap_ec2instance" {
	source = "/EC2"

	region = "us-west-2"
	instance_count = "2"
	amis = "ami-38708b45"
	hap_key_name = srinath
}

module "hap_db" {
	source = "/DB"

	storage = "20"
	engine = "mysql"
	engine_version = "5.7"
	instance_class = "db-t2.micro"
	db_name = "hap_app_db"
	username = "srinath"
	password = "srinath"
}
