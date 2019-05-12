##############################################
##### it takes reference of existing VPC #####
##############################################
data "aws_vpc" "vpc" {
  filter {
    name = "tag:Name"
    values = ["vpc-${var.region_id}*-${var.vpc_seq_id}"]
  }
}
