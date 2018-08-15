resource "aws_elasticsearch_domain" "main" {
  domain_name           = "${var.environment}-${var.cost_centre}-${var.project}-${var.app_service}-${var.seq_id}"
  elasticsearch_version = "${var.es_version}"
  access_policies="${var.access_policies}"
  
  snapshot_options {
    automated_snapshot_start_hour = "${var.automated_snapshot_start_hour}"
  }
  
  /**
  if zone_awareness_enabled is true then instance count must be even number
  */
  cluster_config {
	zone_awareness_enabled   	= "${var.es_zone_awareness}"
    instance_type 				= "${var.es_instance_type}"
	instance_count           	= "${var.es_instance_count}"
	dedicated_master_enabled	= "${var.dedicated_master_enabled}" 
	dedicated_master_count   	= "${var.dedicated_master_count}"
    dedicated_master_type    	= "${var.dedicated_master_type}"
  }
  
  ebs_options {
    ebs_enabled = "${var.ebs_volume_size > 0 ? true : false}"
    volume_size = "${var.ebs_volume_size}"
    volume_type = "${var.ebs_volume_type}"
  }

  tags {
    Domain        		= 	"${var.environment}-${var.cost_centre}-${var.project}-${var.app_service}-${var.seq_id}"
    Environment 		= 	"${var.environment}"
	CostCentre			=	"${var.cost_centre}"
	Project				=	"${var.project}"
	ApplicationService	=	"${var.app_service}"
	Region				=	"${var.region}"
	Compliance			=	"${var.compliance}"
	Confidentiality		=	"${var.confidentiality}"
	VersionId			=	"${var.version_id}"
	BuildDate			=	"${var.build_date}"
 }
  
  #advanced_options {
  #  "rest.action.multi.allow_explicit_index" = "true"
  #}

  /*
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
*/
  
}