
data "aws_route53_zone" "reqZone" {
  name         = "gpol.link."
  private_zone = false
}


module "r53CnameRecord"{
	source="../../../../modules/route53/records/simple-routing"
	primaryzone_id="${data.aws_route53_zone.reqZone.zone_id}"
	record_name="mytests3.uat.gpol.link"
	record_type="CNAME"
	ttl="10"
	records=["abcdsd.weke.com"]
}