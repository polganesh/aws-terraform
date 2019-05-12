##########################
##### Security Group #####
##########################

# it will create security group and associate it with vpc
resource "aws_security_group" "securitygroup" {
  name        = "sgr-${var.region_id}-${var.environment}-${var.owner_name}-vpc${var.vpc_seq_id}-${var.app_service}-${var.seq_id}"
  description = "${var.sg_description}"
  vpc_id      = "${data.aws_vpc.vpc.id}"
  tags {
    Name = "sgr-${var.region_id}-${var.environment}-${var.owner_name}-vpc${var.vpc_seq_id}-${var.app_service}-${var.seq_id}"
    ApplicationService = "${var.app_service}"
    ApplicationRole = "${var.application_role}"
    Cluster = "${var.cluster_member}"
    Environment = "${var.environment}"
    BuildDate = "${var.build_date}"
    MaintenanceDay = "${var.maintenance_day}"
    MaintenanceTime = "${var.maintenance_time}"
    Version = "${var.seq_id}"
    Owner = "${var.owner_name}"
    BusinessUnit = "${var.owner_name}"
    Project = "${var.project}"
    Region = "${var.region}"
    Confidentiality = "${var.confidentiality}"
    Compliance = "${var.compliance}"
    AutoUpdate = "${var.auto_update}"
    CentralSubnets = "${var.central_subnets}"
    AwsResource = "${var.aws_resource_assoc}"
  }
}

resource "aws_security_group_rule" "ingress_cidr_rule" {
  count             = "${length(var.inbound_cidr_rules)}"
  type              = "ingress"
  cidr_blocks       = ["${element(var.inbound_cidr_rules[count.index], 0)}"]
  from_port         = "${element(var.inbound_cidr_rules[count.index], 1)}"
  to_port           = "${element(var.inbound_cidr_rules[count.index], 2)}"
  protocol          = "${element(var.inbound_cidr_rules[count.index], 3)}"
  security_group_id = "${aws_security_group.securitygroup.id}"
}

resource "aws_security_group_rule" "ingress_id_rule" {
  count                    = "${length(var.inbound_id_rules)}"
  type                     = "ingress"
  source_security_group_id = "${element(var.inbound_id_rules[count.index], 0)}"
  from_port                = "${element(var.inbound_id_rules[count.index], 1)}"
  to_port                  = "${element(var.inbound_id_rules[count.index], 2)}"
  protocol                 = "${element(var.inbound_id_rules[count.index], 3)}"
  security_group_id        = "${aws_security_group.securitygroup.id}"
}

resource "aws_security_group_rule" "egress_cidr_rule" {
  count             = "${length(var.outbound_cidr_rules)}"
  type              = "egress"
  cidr_blocks       = ["${element(var.outbound_cidr_rules[count.index], 0)}"]
  from_port         = "${element(var.outbound_cidr_rules[count.index], 1)}"
  to_port           = "${element(var.outbound_cidr_rules[count.index], 2)}"
  protocol          = "${element(var.outbound_cidr_rules[count.index], 3)}"
  security_group_id = "${aws_security_group.securitygroup.id}"
}

resource "aws_security_group_rule" "egress_id_rule" {
  count                          = "${length(var.outbound_id_rules)}"
  type                           = "egress"
  source_security_group_id       = "${element(var.outbound_id_rules[count.index], 0)}"
  from_port                      = "${element(var.outbound_id_rules[count.index], 1)}"
  to_port                        = "${element(var.outbound_id_rules[count.index], 2)}"
  protocol                       = "${element(var.outbound_id_rules[count.index], 3)}"
  security_group_id              = "${aws_security_group.securitygroup.id}"
}



