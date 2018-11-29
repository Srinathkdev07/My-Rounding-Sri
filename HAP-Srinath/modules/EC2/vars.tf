#Definition of variables

variable "region" {
	default = "us-east-1"
}

variable "access_key"{
	default = "AKIA***************"
}

variable "secret_key"{
	default = "dJsjscy5MxECQ6wn****************"
}

#Variables for EC2 instances 
variable "instance_count" {
        default = "2"
}

variable "amis" {
type = "map"

	us-east-1 = "ami-38708b45"
	us-west-2 = "ami-036affea69a1101c9"
}

variable "hap_key_name" {
	default = "srinath"
}

#Declare the data source for availabilty zones
data "aws_availability_zones" "hap_useast_az" {}



