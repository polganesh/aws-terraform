data "aws_region" "current"{}

data "aws_caller_identity" "current" {}

module "esearch-public"{
	source="../../modules/elasticsearch/public"
	es_version="6.2"
	automated_snapshot_start_hour="03"
	es_zone_awareness="true"
	es_instance_type="m4.large.elasticsearch"
	es_instance_count="2"
	dedicated_master_enabled="true"
	dedicated_master_count="3"
	dedicated_master_type="m4.large.elasticsearch"
	ebs_volume_size="10"
	ebs_volume_type="gp2"
	
	environment="dev"
	cost_centre="it"
	project="infra"
	app_service="test"
	compliance="none"
	confidentiality="confidential"
	build_date="13082018"
	version_id="001"
	seq_id="1"
	access_policies= <<CONFIG
		{
			"Version": "2012-10-17",
			"Statement": [
				{
					"Action": "es:*",
					"Principal": "*",
					"Effect": "Allow",
					"Resource": "arn:aws:es:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:domain/dev-it-infra-test-001/*",
					"Condition": {
						"IpAddress": {"aws:SourceIp": ["88.98.242.199/32"]}
					}
				}
			]
		}
	CONFIG
}