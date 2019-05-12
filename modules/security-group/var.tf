################
##### VARS #####
################
variable "region_id" {
  description = "Defines the ID of the region for the Security Group. e.g euw1"
  default = "euw1"
}

variable "sg_description" {
  description = "Defines the description for the security group. Should contain the name of the associated resource."
  default = "Security Group managed by Terraform"
}

variable "vpc_seq_id" {
  description = "Defines the VPC Sequence ID that the Security Group will be associated with. e.g 001"
  default = ""
}

variable "seq_id" {
  description = "Defines the unique sequence ID for the Security Group. e.g 001"
  default = ""
}

variable "application_service" {
  description = "The name of the application service, e.g. infrastructure"
  default = ""
}

variable "application_role" {
  description = "The name of the application role, e.g. app_server"
  default = ""
}

variable "cluster_member" {
  description = "Defines whether the Security Group is part of a cluster resource (i.e Load Balanced)."
  default = "n"
}

variable "environment" {
  description = "The name of your environment, e.g. p for production n for non-production, or dev/sit/uat etc"
  default = ""
}

variable "build_date" {
  description = "The date of build (yyyymmdd), e.g. 20170701"
  default = ""
}

variable "maintenance_day" {
  description = "Defines the day of the week that maintenance activities are permitted. mon/tue/wed etc or none"
  default = ""
}

variable "maintenance_time" {
  description = "Defines the time on maintenance_day that maintenance activities are permitted. 24h format, no colon i.e 0400"
  default = ""
}

variable "owner_name" {
  description = "The name of the tower/stack and owner, e.g. infra, retail"
  default = ""
}

variable "project" {
  description = "The name of your application project, e.g. shared"
  default = ""
}

variable "region" {
  description = "AWS region in which resources are created."
  default = "eu-west-1"
}

variable "confidentiality" {
  description = "An identifier for the specific data-confidentiality level a resource supports. public/internal/confidential/highly confidential"
  default = ""
}

variable "compliance" {
  description = "An identifier for workloads designed to adhere to specific compliance requirements. none/pci"
  default = ""
}

variable "auto_update" {
  description = "Defines whether the Security Group should be auto-updated, by lambda, with any new source addresses."
  default = "true"
}

variable "central_subnets" {
  description = "Defines whether the Security Group should include Morrisons' central subnets as sources."
  default = "true"
}

variable "aws_resource_assoc" {
  description = "Defines the type of AWS resource that the Security Group is associated with. e.g ec2/rds/elb"
  default = ""
}

variable "inbound_cidr_rules" {
  default = {}
}
variable "inbound_id_rules" {
  default = {}
}
variable "outbound_cidr_rules" {
  default = {}
}
variable "outbound_id_rules" {
  default = {}
}

