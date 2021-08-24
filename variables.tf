#----------------------------------------------
# Vars for AWS Creds
#----------------------------------------------
variable "access_key" {
  type        = string
  description = "Enter your aws access_key."
}
variable "secret_key" {
  type        = string
  description = "Enter your aws secret_key."
}

#------------------------------------------------
# Vars for main aws infra deployments
#------------------------------------------------
variable "instance_name" {
  type        = string
  description = "Enter the ec2 instance name."
  default     = "web01"
}
#------------------------------------------------
variable "instance_type" {
  type        = string
  description = "Enter the ec2 instance type."
  default     = "t2.micro"
}
#------------------------------------------------
variable "instance_ami" {
  type        = string
  description = "Enter the ec2 instance ami-id."
  default     = "ami-2757f631"
}
#------------------------------------------------
variable "target_aws_region" {
  type        = string
  description = "Enter the ec2 instance ami-id."
  default     = "us-east-1"
}