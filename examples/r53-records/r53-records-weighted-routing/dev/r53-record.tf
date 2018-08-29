
data "aws_route53_zone" "reqZone" {
  name         = "gpol.link."
  private_zone = false
}


module "r53CnameRecord"{
	source="../../../../modules/route53/records/weighted-routing"
	primaryzone_id="${data.aws_route53_zone.reqZone.zone_id}"
	record_name="mys3ui.uat.gpol.link"
	record_type="CNAME"
	ttl="300"
	records=["abc.weke.com"]
	weight="100"
	set_identifier="test record for dev"
}