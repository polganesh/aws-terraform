resource "aws_elasticsearch_domain" "main" {
  domain_name           = "esdmn-${var.environment}.${var.cost_centre}.${var.project}.${var.app_service}-${var.seq_id}"
  elasticsearch_version = "${var.es_version}"
  cluster_config {
    instance_type = "r3.large.elasticsearch"
  }

  advanced_options {
    "rest.action.multi.allow_explicit_index" = "true"
  }

  access_policies = <<CONFIG
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "es:*",
            "Principal": "*",
            "Effect": "Allow",
            "Resource": "arn:aws:es:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:domain/${var.domain}/*",
            "Condition": {
                "IpAddress": {"aws:SourceIp": ["66.193.100.22/32"]}
            }
        }
    ]
}
CONFIG

  snapshot_options {
    automated_snapshot_start_hour = 23
  }

  tags {
    Domain        = "esdmn-${var.environment}.${var.cost_centre}.${var.project}.${var.app_service}-${var.seq_id}"
    Environment = "${var.environment}"
	CostCentre="${var.cost_centre}"
	Project="${var.project}"
	ApplicationService="${var.app_service}"
	Region="${var.region}"
	Compliance="${var.compliance}"
	Confidentiality="${var.confidentiality}"
	VersionId="${var.version_id}"
	BuildDate="${var.build_date}"
	MaintainanceDay="${var.maintainance_day}"
	MaintainanceTime="${var.maintainance_time}"
 }
}