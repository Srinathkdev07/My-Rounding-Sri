

#Variables for DB instances
variable "storage" {
	default = 20
}
variable "engine" {
	default = "mysql"
}
variable "engine_version" {
	default = "5.7"
}
variable "instance_class" {
	default = "db.t2.micro"
}
variable "db_name" {
	default = "hap_app_db"
}
variable "username" {
	default = "srinath"
}
variable "password" {
	default = "srinath"
}

#Declare the data source for availabilty zones
data "aws_availability_zones" "hap_useast_az" {}



