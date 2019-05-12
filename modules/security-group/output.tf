###################
##### Outputs #####
###################
output "securitygroup_id" {
  value = "${aws_security_group.securitygroup.id}"
}

output "vpc_id" {
  value = "${aws_security_group.securitygroup.vpc_id}"
}


